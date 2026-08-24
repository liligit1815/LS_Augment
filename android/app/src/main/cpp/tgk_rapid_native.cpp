#include <jni.h>

#include <android/log.h>
#include <shadowhook.h>

#include <atomic>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <time.h>

namespace {

constexpr char kLogTag[] = "LS_Augment/TgkNative";
constexpr char kExpectedInputReaderSha256[] =
        "203e202857b42e9b043466a8ddf793a5972278c3f1af71f244be790322a17d1a";
constexpr char kInputReaderLibrary[] = "libinputreader.so";
constexpr char kRapidDataSymbol[] =
        "_ZN7android13EventProducer22updateTgkRapidFireDataEi";

constexpr int kLeftKeyCode = 137;
constexpr int kRightKeyCode = 138;
constexpr int kMinCps = 10;
constexpr int kMaxCps = 50;
constexpr int64_t kNanosecondsPerSecond = 1000000000LL;
constexpr int32_t kMinimumPhaseNanoseconds = 5000000;

// These offsets belong only to the verified libinputreader.so profile above.
// Unknown hashes never reach this code path.
struct RapidDataProfile {
    size_t countOffset;
    size_t downOffset;
    size_t upOffset;
};

constexpr RapidDataProfile kLeftProfile{0x60, 0x50, 0x54};
constexpr RapidDataProfile kRightProfile{0x64, 0x58, 0x5c};

using UpdateRapidDataFn = void (*)(void*, int);

std::atomic<int> g_leftCps{0};
std::atomic<int> g_rightCps{0};
std::atomic<uint64_t> g_appliedCount{0};
std::atomic<int64_t> g_lastLogMillis{0};
std::atomic<bool> g_installAttempted{false};
std::atomic<bool> g_installed{false};

// The hook can become visible to InputReader while the Java installation
// call is still publishing its trampoline. Use an atomic function pointer so
// that an early callback can safely observe nullptr instead of racing a
// non-atomic pointer write.
std::atomic<UpdateRapidDataFn> g_originalUpdateRapidData{nullptr};
void* g_hookStub = nullptr;

// Written during the one-time installation path and read by the diagnostic
// JNI method. The hot proxy path never touches this buffer.
char g_state[256] = "not_loaded";

void setState(const char* format, const char* value) {
    std::snprintf(g_state, sizeof(g_state), format, value == nullptr ? "" : value);
}

void setErrorState(const char* prefix, int errorNumber) {
    std::snprintf(g_state, sizeof(g_state), "%s%d", prefix, errorNumber);
}

int64_t monotonicMillis() {
    timespec now{};
    if (clock_gettime(CLOCK_MONOTONIC, &now) != 0) return 0;
    return static_cast<int64_t>(now.tv_sec) * 1000LL + now.tv_nsec / 1000000LL;
}

const RapidDataProfile* profileForKey(int keyCode) {
    if (keyCode == kLeftKeyCode) return &kLeftProfile;
    if (keyCode == kRightKeyCode) return &kRightProfile;
    return nullptr;
}

int desiredCpsForKey(int keyCode) {
    if (keyCode == kLeftKeyCode) return g_leftCps.load(std::memory_order_acquire);
    if (keyCode == kRightKeyCode) return g_rightCps.load(std::memory_order_acquire);
    return 0;
}

void storeCpsForKey(int keyCode, int cps) {
    cps = cps < 0 ? 0 : (cps > kMaxCps ? kMaxCps : cps);
    if (keyCode == kLeftKeyCode) {
        g_leftCps.store(cps, std::memory_order_release);
    } else if (keyCode == kRightKeyCode) {
        g_rightCps.store(cps, std::memory_order_release);
    }
}

void updateRapidDataProxy(void* self, int keyCode) {
    // The OEM calculation must always run first. This preserves all native
    // state initialization and provides a safe value for the fallback path.
    //
    // This hook is installed in ShadowHook's UNIQUE mode. UNIQUE/MULTI mode
    // proxies call the trampoline returned in orig_addr directly; the
    // SHADOWHOOK_STACK_SCOPE cleanup is only required for SHARED mode and
    // would dereference an empty shared-mode stack on return.
    const UpdateRapidDataFn original =
            g_originalUpdateRapidData.load(std::memory_order_acquire);
    if (original != nullptr) {
        original(self, keyCode);
    }

    const int cps = desiredCpsForKey(keyCode);
    const RapidDataProfile* profile = profileForKey(keyCode);
    if (self == nullptr || profile == nullptr || cps <= kMinCps
            || cps > kMaxCps) {
        return;
    }

    const uintptr_t base = reinterpret_cast<uintptr_t>(self);
    auto* countAddress = reinterpret_cast<int32_t*>(base + profile->countOffset);
    const int32_t vendorCount = __atomic_load_n(countAddress, __ATOMIC_ACQUIRE);
    if (vendorCount < 1 || vendorCount > kMaxCps) {
        // The object layout does not match the verified profile. Do not write.
        return;
    }

    const int64_t period = kNanosecondsPerSecond / cps;
    const int32_t down = static_cast<int32_t>((period * 3 + 2) / 5);
    const int32_t up = static_cast<int32_t>(period - down);
    if (down < kMinimumPhaseNanoseconds || up < kMinimumPhaseNanoseconds) {
        return;
    }

    auto* downAddress = reinterpret_cast<int32_t*>(base + profile->downOffset);
    auto* upAddress = reinterpret_cast<int32_t*>(base + profile->upOffset);
    __atomic_store_n(downAddress, down, __ATOMIC_RELEASE);
    __atomic_store_n(upAddress, up, __ATOMIC_RELEASE);

    const uint64_t applied = g_appliedCount.fetch_add(1, std::memory_order_relaxed) + 1;
    const int64_t now = monotonicMillis();
    int64_t last = g_lastLogMillis.load(std::memory_order_relaxed);
    if (now - last >= 1000
            && g_lastLogMillis.compare_exchange_strong(
                    last, now, std::memory_order_relaxed)) {
        __android_log_print(ANDROID_LOG_INFO, kLogTag,
                "NATIVE_HIT key=%d cps=%d period_ns=%lld down_ns=%d up_ns=%d applied=%llu",
                keyCode, cps, static_cast<long long>(period), down, up,
                static_cast<unsigned long long>(applied));
    }
}

jstring stateString(JNIEnv* env) {
    return env->NewStringUTF(g_state);
}

}  // namespace

extern "C" JNIEXPORT jstring JNICALL
Java_ls_augment_com_hook_TgkRapidFireNative_nativeInstall(
        JNIEnv* env, jclass, jstring inputReaderSha256) {
    if (g_installAttempted.exchange(true, std::memory_order_acq_rel)) {
        return stateString(env);
    }

    if (inputReaderSha256 == nullptr) {
        setState("unsupported|missing_sha256", nullptr);
        return stateString(env);
    }

    const char* supplied = env->GetStringUTFChars(inputReaderSha256, nullptr);
    const bool supported = supplied != nullptr
            && std::strcmp(supplied, kExpectedInputReaderSha256) == 0;
    if (supplied != nullptr) env->ReleaseStringUTFChars(inputReaderSha256, supplied);
    if (!supported) {
        setState("unsupported|sha256_mismatch", nullptr);
        __android_log_print(ANDROID_LOG_WARN, kLogTag,
                "NATIVE_FALLBACK reason=sha256_mismatch");
        return stateString(env);
    }

    const int initResult = shadowhook_init(SHADOWHOOK_MODE_UNIQUE, false);
    if (initResult != 0) {
        // v2.0.0 exposes the initialization failure through the common
        // errno accessor; keep the bridge linkable across the v2.x AARs.
        const int errorNumber = shadowhook_get_errno();
        setErrorState("error|shadowhook_init=", errorNumber);
        __android_log_print(ANDROID_LOG_ERROR, kLogTag,
                "NATIVE_FALLBACK stage=init result=%d errno=%d msg=%s",
                initResult, errorNumber, shadowhook_to_errmsg(errorNumber));
        return stateString(env);
    }

    void* original = nullptr;
    g_hookStub = shadowhook_hook_sym_name_2(
            kInputReaderLibrary,
            kRapidDataSymbol,
            reinterpret_cast<void*>(updateRapidDataProxy),
            &original,
            SHADOWHOOK_HOOK_WITH_UNIQUE_MODE);
    if (g_hookStub == nullptr || original == nullptr) {
        const int errorNumber = shadowhook_get_errno();
        setErrorState("error|shadowhook_hook=", errorNumber);
        __android_log_print(ANDROID_LOG_ERROR, kLogTag,
                "NATIVE_FALLBACK stage=hook errno=%d msg=%s",
                errorNumber, shadowhook_to_errmsg(errorNumber));
        return stateString(env);
    }

    g_originalUpdateRapidData.store(
            reinterpret_cast<UpdateRapidDataFn>(original),
            std::memory_order_release);
    g_installed.store(true, std::memory_order_release);
    setState("installed|profile=nx809j_inputreader_v1", nullptr);
    __android_log_print(ANDROID_LOG_INFO, kLogTag,
            "NATIVE_INSTALLED library=%s symbol=%s", kInputReaderLibrary,
            kRapidDataSymbol);
    return stateString(env);
}

extern "C" JNIEXPORT void JNICALL
Java_ls_augment_com_hook_TgkRapidFireNative_nativeSetTarget(
        JNIEnv*, jclass, jint keyCode, jint cps) {
    if (!g_installed.load(std::memory_order_acquire)) return;
    storeCpsForKey(static_cast<int>(keyCode), static_cast<int>(cps));
}

extern "C" JNIEXPORT jstring JNICALL
Java_ls_augment_com_hook_TgkRapidFireNative_nativeState(JNIEnv* env, jclass) {
    return stateString(env);
}
