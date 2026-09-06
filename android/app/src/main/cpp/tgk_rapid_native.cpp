#include <jni.h>

#include <android/log.h>
#include <dlfcn.h>
#include <elf.h>
#include <fcntl.h>
#include <link.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>

#include <atomic>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <initializer_list>
#include <time.h>
#include "tgk_layout_probe.h"
#include "tgk_cadence_probe.h"
#include <pthread.h>

using HookFunType = int (*)(void*, void*, void**);
using UnhookFunType = int (*)(void*);
using NativeOnModuleLoaded = void (*)(const char*, void*);

struct NativeAPIEntries {
    uint32_t version;
    HookFunType hook_func;
    UnhookFunType unhook_func;
};

namespace {

constexpr char kLogTag[] = "LS_Augment/TgkNative";
constexpr char kInputReaderLibrary[] = "libinputreader.so";
constexpr char kInputReaderPath[] = "/system/lib64/libinputreader.so";
constexpr char kRapidDataSymbol[] =
        "_ZN7android13EventProducer22updateTgkRapidFireDataEi";

constexpr int kMinCps = 10;
constexpr int kMaxCps = 50;
constexpr int64_t kNanosecondsPerSecond = 1000000000LL;
constexpr int32_t kMinimumPhaseNanoseconds = 5000000;

// Offsets and key-to-field relationships are derived from the verified function.
struct RapidDataOffsets {
    size_t countOffset;
    size_t downOffset;
    size_t upOffset;
};

struct RapidDataProfile {
    const char* name;
    int firstKey;
    int secondKey;
    RapidDataOffsets left;
    RapidDataOffsets right;
};

RapidDataProfile g_discoveredProfile{"arm64_tgk_split_phase_v1", -1, -1, {}, {}};

using UpdateRapidDataFn = void (*)(void*, int);

std::atomic<int> g_leftCps{0};
std::atomic<int> g_rightCps{0};
std::atomic<int> g_leftKeyCode{-1};
std::atomic<int> g_rightKeyCode{-1};
std::atomic<const RapidDataProfile*> g_activeProfile{nullptr};
std::atomic<uint64_t> g_appliedCount{0};
std::atomic<uint64_t> g_leftAppliedCount{0};
std::atomic<uint64_t> g_rightAppliedCount{0};
std::atomic<uint64_t> g_observedCount{0};
std::atomic<int> g_lastObservedKey{-1};
std::atomic<int64_t> g_lastObservedMillis{0};
std::atomic<int64_t> g_lastLogMillis{0};
std::atomic<bool> g_installAttempted{false};
std::atomic<bool> g_installed{false};
std::atomic<bool> g_ready{false};
std::atomic<HookFunType> g_hookFunction{nullptr};
std::atomic<UnhookFunType> g_unhookFunction{nullptr};
std::atomic<uint32_t> g_nativeApiVersion{0};

// LSPosed publishes the trampoline through this storage before its backend
// exposes the patched entry point. The proxy still uses an acquire load so an
// early callback can safely observe either nullptr or the complete pointer.
void* g_originalUpdateRapidData = nullptr;
void* g_hookTarget = nullptr;
void* g_originalStart=nullptr;
void* g_originalStop=nullptr;
std::atomic<bool> g_cadenceReady{false};
std::atomic<bool> g_cadenceArmed{false};
pthread_mutex_t g_cadenceMutex=PTHREAD_MUTEX_INITIALIZER;
struct CadenceGuard { CadenceGuard(){pthread_mutex_lock(&g_cadenceMutex);} ~CadenceGuard(){pthread_mutex_unlock(&g_cadenceMutex);} };
tgk_cadence::Probe g_cadence;
char g_cadenceIdentity[96]{};

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

void startProxy(void* self,int mask){
    auto original=reinterpret_cast<UpdateRapidDataFn>(__atomic_load_n(&g_originalStart,__ATOMIC_ACQUIRE));
    if(original!=nullptr)original(self,mask);
    if(g_cadenceArmed.load(std::memory_order_acquire)){CadenceGuard lock;g_cadence.start(self,mask);}
}
void stopProxy(void* self,int mask){
    auto original=reinterpret_cast<UpdateRapidDataFn>(__atomic_load_n(&g_originalStop,__ATOMIC_ACQUIRE));
    if(original!=nullptr)original(self,mask);
    if(g_cadenceArmed.load(std::memory_order_acquire)){CadenceGuard lock;g_cadence.stop(self,mask,monotonicMillis());}
}

const RapidDataProfile* profileForKey(int keyCode) {
    const RapidDataProfile* profile =
            g_activeProfile.load(std::memory_order_acquire);
    if (profile == nullptr) return nullptr;
    if (keyCode == g_leftKeyCode.load(std::memory_order_acquire)) return profile;
    if (keyCode == g_rightKeyCode.load(std::memory_order_acquire)) return profile;
    return nullptr;
}

const RapidDataOffsets* offsetsForKey(const RapidDataProfile* profile, int keyCode) {
    if (profile == nullptr) return nullptr;
    if (keyCode == profile->firstKey) return &profile->left;
    if (keyCode == profile->secondKey) return &profile->right;
    return nullptr;
}

int desiredCpsForKey(int keyCode) {
    if (keyCode == g_leftKeyCode.load(std::memory_order_acquire)) {
        return g_leftCps.load(std::memory_order_acquire);
    }
    if (keyCode == g_rightKeyCode.load(std::memory_order_acquire)) {
        return g_rightCps.load(std::memory_order_acquire);
    }
    return 0;
}

void storeCpsForKey(int keyCode, int cps) {
    cps = cps < 0 ? 0 : (cps > kMaxCps ? kMaxCps : cps);
    if (keyCode == g_leftKeyCode.load(std::memory_order_acquire)) {
        g_leftCps.store(cps, std::memory_order_release);
    } else if (keyCode == g_rightKeyCode.load(std::memory_order_acquire)) {
        g_rightCps.store(cps, std::memory_order_release);
    }
}

void updateRapidDataProxy(void* self, int keyCode) {
    // The OEM calculation must always run first. This preserves all native
    // state initialization and provides a safe value for the fallback path.
    //
    // LSPosed's native API publishes the verified trampoline before the
    // patched entry point can dispatch here.
    const UpdateRapidDataFn original = reinterpret_cast<UpdateRapidDataFn>(
            __atomic_load_n(&g_originalUpdateRapidData, __ATOMIC_ACQUIRE));
    if (original != nullptr) {
        original(self, keyCode);
    }

    // Compatibility discovery is read-only: observing the symbol argument
    // neither assumes a side nor touches the vendor object layout. Java only
    // publishes a mapping after a new observation appears during an explicit
    // user-started test session.
    g_lastObservedKey.store(keyCode, std::memory_order_release);
    g_lastObservedMillis.store(monotonicMillis(), std::memory_order_release);
    g_observedCount.fetch_add(1, std::memory_order_acq_rel);

    // Never touch vendor memory until the trampoline, verified layout and
    // dynamically discovered side mapping have all been published.
    if (!g_ready.load(std::memory_order_acquire)) return;

    const int cps = desiredCpsForKey(keyCode);
    const RapidDataProfile* profile = profileForKey(keyCode);
    const RapidDataOffsets* offsets = offsetsForKey(profile, keyCode);
    if (self == nullptr || offsets == nullptr || cps <= kMinCps
            || cps > kMaxCps) {
        return;
    }

    const uintptr_t base = reinterpret_cast<uintptr_t>(self);
    auto* countAddress = reinterpret_cast<int32_t*>(base + offsets->countOffset);
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

    auto* downAddress = reinterpret_cast<int32_t*>(base + offsets->downOffset);
    auto* upAddress = reinterpret_cast<int32_t*>(base + offsets->upOffset);
    const int32_t vendorDown = __atomic_load_n(downAddress, __ATOMIC_ACQUIRE);
    const int32_t vendorUp = __atomic_load_n(upAddress, __ATOMIC_ACQUIRE);
    // The verified routine must have just produced the expected 3:2 phases.
    // A changed runtime object or out-of-range value revokes writes immediately.
    if (vendorDown <= 0 || vendorUp <= 0 || vendorDown > 1000000000
            || vendorUp > 1000000000
            || static_cast<int64_t>(vendorDown) * 2 != static_cast<int64_t>(vendorUp) * 3) return;
    __atomic_store_n(downAddress, down, __ATOMIC_RELEASE);
    __atomic_store_n(upAddress, up, __ATOMIC_RELEASE);

    const uint64_t applied = g_appliedCount.fetch_add(1, std::memory_order_relaxed) + 1;
    if (keyCode == g_leftKeyCode.load(std::memory_order_relaxed)) {
        g_leftAppliedCount.fetch_add(1, std::memory_order_relaxed);
    } else if (keyCode == g_rightKeyCode.load(std::memory_order_relaxed)) {
        g_rightAppliedCount.fetch_add(1, std::memory_order_relaxed);
    }
    const int64_t now = monotonicMillis();
    if(g_cadenceArmed.load(std::memory_order_acquire)){
        CadenceGuard lock;g_cadence.down(self,keyCode,now);
    }
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
    char value[512];
    std::snprintf(value, sizeof(value),
            "%s|ready=%d|left_key=%d|right_key=%d|applied=%llu|left_applied=%llu|right_applied=%llu|observed=%llu|last_observed_key=%d|last_observed_ms=%lld",
            g_state, g_ready.load(std::memory_order_acquire) ? 1 : 0,
            g_leftKeyCode.load(std::memory_order_acquire),
            g_rightKeyCode.load(std::memory_order_acquire),
            static_cast<unsigned long long>(g_appliedCount.load(std::memory_order_relaxed)),
            static_cast<unsigned long long>(g_leftAppliedCount.load(std::memory_order_relaxed)),
            static_cast<unsigned long long>(g_rightAppliedCount.load(std::memory_order_relaxed)),
            static_cast<unsigned long long>(g_observedCount.load(std::memory_order_relaxed)),
            g_lastObservedKey.load(std::memory_order_relaxed),
            static_cast<long long>(g_lastObservedMillis.load(std::memory_order_relaxed)));
    return env->NewStringUTF(value);
}

bool endsWith(const char* value, const char* suffix) {
    if (value == nullptr || suffix == nullptr) return false;
    const size_t valueLength = std::strlen(value);
    const size_t suffixLength = std::strlen(suffix);
    return valueLength >= suffixLength
            && std::strcmp(value + valueLength - suffixLength, suffix) == 0;
}

bool rangeWithin(size_t offset, size_t length, size_t total) {
    return offset <= total && length <= total - offset;
}

struct LoadedSymbolLookup {
    uintptr_t symbolValue;
    size_t symbolSize;
    void* address;
};

int findLoadedInputReader(dl_phdr_info* info, size_t, void* opaque) {
    auto* lookup = static_cast<LoadedSymbolLookup*>(opaque);
    if (info == nullptr || lookup == nullptr
            || !endsWith(info->dlpi_name, "/libinputreader.so")) {
        return 0;
    }
    const uintptr_t loadBase = static_cast<uintptr_t>(info->dlpi_addr);
    if (lookup->symbolValue > UINTPTR_MAX - loadBase) return 0;
    const uintptr_t address = loadBase + lookup->symbolValue;
    for (ElfW(Half) index = 0; index < info->dlpi_phnum; ++index) {
        const ElfW(Phdr)& header = info->dlpi_phdr[index];
        if (header.p_type != PT_LOAD || (header.p_flags & PF_X) == 0) continue;
        if (header.p_vaddr > UINTPTR_MAX - loadBase) continue;
        const uintptr_t start = loadBase + header.p_vaddr;
        if (header.p_memsz > UINTPTR_MAX - start) continue;
        const uintptr_t end = start + header.p_memsz;
        if (address >= start && address < end && lookup->symbolSize <= end - address) {
            lookup->address = reinterpret_cast<void*>(address);
            return 1;
        }
    }
    return 0;
}

void* resolveSymbolFromVerifiedElf(const char* wanted=kRapidDataSymbol,bool inspectLayout=true) {
    int fd = open(kInputReaderPath, O_RDONLY | O_CLOEXEC);
    if (fd < 0) return nullptr;
    struct stat status{};
    if (fstat(fd, &status) != 0 || status.st_size <= 0
            || status.st_size > 64 * 1024 * 1024) {
        close(fd);
        return nullptr;
    }
    const size_t fileSize = static_cast<size_t>(status.st_size);
    void* mapped = mmap(nullptr, fileSize, PROT_READ, MAP_PRIVATE, fd, 0);
    close(fd);
    if (mapped == MAP_FAILED) return nullptr;

    const auto* bytes = static_cast<const uint8_t*>(mapped);
    uintptr_t symbolValue = 0;
    uint8_t verifiedCode[512]{};
    size_t verifiedSize = 0;
    tgk_layout::Layout layout{};
    bool malformed = false;
    bool found = false;
    if (fileSize < sizeof(Elf64_Ehdr)) {
        malformed = true;
    } else {
        const auto* elf = reinterpret_cast<const Elf64_Ehdr*>(bytes);
        malformed = std::memcmp(elf->e_ident, ELFMAG, SELFMAG) != 0
                || elf->e_ident[EI_CLASS] != ELFCLASS64
                || elf->e_ident[EI_DATA] != ELFDATA2LSB
                || elf->e_machine != EM_AARCH64
                || elf->e_type != ET_DYN
                || elf->e_shentsize != sizeof(Elf64_Shdr)
                || elf->e_shnum == 0
                || !rangeWithin(elf->e_shoff,
                        static_cast<size_t>(elf->e_shnum) * sizeof(Elf64_Shdr),
                        fileSize);
        if (!malformed) {
            const auto* sections = reinterpret_cast<const Elf64_Shdr*>(
                    bytes + elf->e_shoff);
            for (Elf64_Half sectionIndex = 0;
                    sectionIndex < elf->e_shnum && !malformed; ++sectionIndex) {
                const Elf64_Shdr& symbols = sections[sectionIndex];
                if (symbols.sh_type != SHT_DYNSYM && symbols.sh_type != SHT_SYMTAB) {
                    continue;
                }
                if (symbols.sh_link >= elf->e_shnum
                        || symbols.sh_entsize < sizeof(Elf64_Sym)
                        || symbols.sh_size % symbols.sh_entsize != 0
                        || !rangeWithin(symbols.sh_offset, symbols.sh_size, fileSize)) {
                    malformed = true;
                    break;
                }
                const Elf64_Shdr& strings = sections[symbols.sh_link];
                if (strings.sh_type != SHT_STRTAB
                        || !rangeWithin(strings.sh_offset, strings.sh_size, fileSize)) {
                    malformed = true;
                    break;
                }
                const char* stringTable = reinterpret_cast<const char*>(
                        bytes + strings.sh_offset);
                const size_t symbolCount = symbols.sh_size / symbols.sh_entsize;
                for (size_t symbolIndex = 0; symbolIndex < symbolCount; ++symbolIndex) {
                    const auto* symbol = reinterpret_cast<const Elf64_Sym*>(
                            bytes + symbols.sh_offset
                                    + symbolIndex * symbols.sh_entsize);
                    if (symbol->st_name >= strings.sh_size
                            || ELF64_ST_TYPE(symbol->st_info) != STT_FUNC
                            || symbol->st_shndx == SHN_UNDEF || symbol->st_value == 0) {
                        continue;
                    }
                    const char* name = stringTable + symbol->st_name;
                    const size_t remaining = strings.sh_size - symbol->st_name;
                    if (std::memchr(name, '\0', remaining) == nullptr
                            || std::strcmp(name, wanted) != 0) {
                        continue;
                    }
                    if (found && symbolValue != symbol->st_value) {
                        malformed = true;
                        break;
                    }
                    if (symbol->st_shndx >= elf->e_shnum || symbol->st_size == 0
                            || symbol->st_size > sizeof(verifiedCode)) {
                        malformed = true;
                        break;
                    }
                    const Elf64_Shdr& codeSection = sections[symbol->st_shndx];
                    if ((codeSection.sh_flags & SHF_EXECINSTR) == 0
                            || symbol->st_value < codeSection.sh_addr) {
                        malformed = true;
                        break;
                    }
                    size_t delta = symbol->st_value - codeSection.sh_addr;
                    if (!rangeWithin(delta, symbol->st_size, codeSection.sh_size)
                            || codeSection.sh_offset > fileSize
                            || delta > fileSize - codeSection.sh_offset
                            || !rangeWithin(codeSection.sh_offset + delta, symbol->st_size, fileSize)
                            || (inspectLayout&&!tgk_layout::inspect(bytes + codeSection.sh_offset + delta,
                                    symbol->st_size, &layout))) {
                        malformed = true;
                        break;
                    }
                    verifiedSize = symbol->st_size;
                    std::memcpy(verifiedCode, bytes + codeSection.sh_offset + delta, verifiedSize);
                    found = true;
                    symbolValue = symbol->st_value;
                }
            }
        }
    }
    munmap(mapped, fileSize);
    if (malformed || !found) return nullptr;

    LoadedSymbolLookup lookup{symbolValue, verifiedSize, nullptr};
    dl_iterate_phdr(findLoadedInputReader, &lookup);
    if (lookup.address == nullptr || std::memcmp(lookup.address, verifiedCode, verifiedSize) != 0) return nullptr;
    if(inspectLayout){
        g_discoveredProfile.firstKey = layout.firstKey;
        g_discoveredProfile.secondKey = layout.secondKey;
        g_discoveredProfile.left = {layout.firstCount, layout.firstDown, layout.firstUp};
        g_discoveredProfile.right = {layout.secondCount, layout.secondDown, layout.secondUp};
    }
    return lookup.address;
}

void* resolveRapidDataSymbol() {
    // Verify the full ELF function, derive its fields, and compare every live
    // instruction before installing. dlsym alone is not structural evidence.
    return resolveSymbolFromVerifiedElf();
}

void onNativeLibraryLoaded(const char*, void*) {
    // The rapid-fire hook is deliberately installed only by nativeInstall()
    // after the explicit compatibility session and structural checks.
}

}  // namespace

// Modern LSPosed calls this entry for libraries declared in
// META-INF/xposed/native_init.list. Its hook backend already lives inside the
// framework and does not depend on private linker symbols from the vendor ROM.
extern "C" [[gnu::visibility("default")]] [[gnu::used]]
NativeOnModuleLoaded native_init(const NativeAPIEntries* entries) {
    if (entries == nullptr || entries->hook_func == nullptr) return nullptr;
    g_nativeApiVersion.store(entries->version, std::memory_order_release);
    g_unhookFunction.store(entries->unhook_func, std::memory_order_release);
    g_hookFunction.store(entries->hook_func, std::memory_order_release);
    return onNativeLibraryLoaded;
}

extern "C" JNIEXPORT jstring JNICALL
Java_ls_augment_com_hook_TgkRapidFireNative_nativeInstall(
        JNIEnv* env, jclass) {
    if (g_installAttempted.exchange(true, std::memory_order_acq_rel)) {
        return stateString(env);
    }

    const HookFunType hookFunction =
            g_hookFunction.load(std::memory_order_acquire);
    if (hookFunction == nullptr) {
        setState("error|lsposed_native_api_unavailable", nullptr);
        __android_log_print(ANDROID_LOG_ERROR, kLogTag,
                "NATIVE_FALLBACK stage=lsposed_native_api");
        return stateString(env);
    }

    void* target = resolveRapidDataSymbol();
    Dl_info symbolInfo{};
    if (target == nullptr || dladdr(target, &symbolInfo) == 0
            || !endsWith(symbolInfo.dli_fname, "/libinputreader.so")) {
        setState("incompatible|stage=live_function_structure", nullptr);
        __android_log_print(ANDROID_LOG_ERROR, kLogTag,
                "NATIVE_FALLBACK stage=resolve_symbol");
        return stateString(env);
    }

    g_hookTarget = target;
    __atomic_store_n(&g_originalUpdateRapidData, nullptr, __ATOMIC_RELEASE);
    const int hookResult = hookFunction(target,
            reinterpret_cast<void*>(updateRapidDataProxy),
            &g_originalUpdateRapidData);
    void* original = __atomic_load_n(
            &g_originalUpdateRapidData, __ATOMIC_ACQUIRE);
    if (hookResult != 0 || original == nullptr) {
        const UnhookFunType unhookFunction =
                g_unhookFunction.load(std::memory_order_acquire);
        if (unhookFunction != nullptr && original != nullptr) {
            unhookFunction(target);
        }
        __atomic_store_n(&g_originalUpdateRapidData, nullptr, __ATOMIC_RELEASE);
        g_hookTarget = nullptr;
        setErrorState("error|lsposed_native_hook=", hookResult);
        __android_log_print(ANDROID_LOG_ERROR, kLogTag,
                "NATIVE_FALLBACK stage=hook result=%d original=%p",
                hookResult, original);
        return stateString(env);
    }

    void* start=resolveSymbolFromVerifiedElf("_ZN7android13EventProducer5startEi",false);
    void* stop=resolveSymbolFromVerifiedElf("_ZN7android13EventProducer4stopEi",false);
    if(start!=nullptr&&stop!=nullptr){
        int a=hookFunction(start,reinterpret_cast<void*>(startProxy),&g_originalStart);
        int b=hookFunction(stop,reinterpret_cast<void*>(stopProxy),&g_originalStop);
        g_cadenceReady.store(a==0&&b==0&&g_originalStart!=nullptr&&g_originalStop!=nullptr,std::memory_order_release);
    }
    g_activeProfile.store(&g_discoveredProfile, std::memory_order_release);
    g_installed.store(true, std::memory_order_release);
    // Key mappings are published by nativeConfigureKeys after the Java layer
    // has observed the current device. Until then the proxy calls OEM only.
    g_ready.store(false, std::memory_order_release);
    std::snprintf(g_state, sizeof(g_state),
            "installed|backend=lsposed_native_api|api=%u|profile=%s",
            g_nativeApiVersion.load(std::memory_order_acquire),
            g_discoveredProfile.name);
    __android_log_print(ANDROID_LOG_INFO, kLogTag,
            "NATIVE_INSTALLED library=%s symbol=%s", kInputReaderLibrary,
            kRapidDataSymbol);
    return stateString(env);
}

extern "C" JNIEXPORT void JNICALL
Java_ls_augment_com_hook_TgkRapidFireNative_nativeConfigureKeys(
        JNIEnv*, jclass, jint leftKeyCode, jint rightKeyCode) {
    if (!g_installed.load(std::memory_order_acquire)) return;
    const int left = static_cast<int>(leftKeyCode);
    const int right = static_cast<int>(rightKeyCode);
    if (left == 0 || right == 0 || left < -1 || right < -1
            || left > 65535 || right > 65535 || (left > 0 && left == right)) {
        return;
    }
    for (int key : {left, right}) {
        if (key > 0 && key != g_discoveredProfile.firstKey && key != g_discoveredProfile.secondKey) return;
    }
    g_ready.store(false, std::memory_order_release);
    g_leftCps.store(0, std::memory_order_release);
    g_rightCps.store(0, std::memory_order_release);
    g_leftKeyCode.store(left, std::memory_order_release);
    g_rightKeyCode.store(right, std::memory_order_release);
    g_ready.store(left > 0 || right > 0, std::memory_order_release);
}

extern "C" JNIEXPORT void JNICALL
Java_ls_augment_com_hook_TgkRapidFireNative_nativeClearTargets(
        JNIEnv*, jclass) {
    // Revoke readiness first. A concurrently executing proxy must observe the
    // fail-closed state before any mapping or target is removed.
    g_ready.store(false, std::memory_order_release);
    g_leftCps.store(0, std::memory_order_release);
    g_rightCps.store(0, std::memory_order_release);
    g_leftKeyCode.store(-1, std::memory_order_release);
    g_rightKeyCode.store(-1, std::memory_order_release);
}

extern "C" JNIEXPORT void JNICALL
Java_ls_augment_com_hook_TgkRapidFireNative_nativeArmCadence(
        JNIEnv* env,jclass,jstring identity,jint key){
    CadenceGuard lock;
    if(identity==nullptr||key<1||!g_cadenceReady.load(std::memory_order_acquire)){
        g_cadenceArmed.store(false,std::memory_order_release);g_cadence.arm(-1);g_cadenceIdentity[0]='\0';return;
    }
    const char* text=env->GetStringUTFChars(identity,nullptr);if(text==nullptr)return;
    if(std::strlen(text)>=sizeof(g_cadenceIdentity)){env->ReleaseStringUTFChars(identity,text);return;}
    if(std::strcmp(g_cadenceIdentity,text)!=0||g_cadence.key!=key){
        std::snprintf(g_cadenceIdentity,sizeof(g_cadenceIdentity),"%s",text);g_cadence.arm(key);
    }
    env->ReleaseStringUTFChars(identity,text);g_cadenceArmed.store(true,std::memory_order_release);
}

extern "C" JNIEXPORT jstring JNICALL
Java_ls_augment_com_hook_TgkRapidFireNative_nativeCadence(JNIEnv* env,jclass){
    CadenceGuard lock;char out[256];int64_t now=monotonicMillis();
    std::snprintf(out,sizeof(out),"ready=%d|key=%d|count=%d|span=%lld|cps=%.2f|released=%d|quiet=%lld|late=%d|passed=%d",
        g_cadenceReady.load()?1:0,g_cadence.key,g_cadence.count,static_cast<long long>(g_cadence.last-g_cadence.first),
        g_cadence.cps(),g_cadence.released>0?1:0,static_cast<long long>(g_cadence.released>0?now-g_cadence.released:0),
        g_cadence.late?1:0,g_cadence.passed(now)?1:0);
    return env->NewStringUTF(out);
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

extern "C" JNIEXPORT jstring JNICALL
Java_ls_augment_com_hook_TgkRapidFireNative_nativeObservation(JNIEnv* env, jclass) {
    char value[160];
    std::snprintf(value, sizeof(value), "key=%d|sequence=%llu|monotonic=%lld",
            g_lastObservedKey.load(std::memory_order_acquire),
            static_cast<unsigned long long>(
                    g_observedCount.load(std::memory_order_acquire)),
            static_cast<long long>(
                    g_lastObservedMillis.load(std::memory_order_acquire)));
    return env->NewStringUTF(value);
}
