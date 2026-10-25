#include <jni.h>
#include <memory>
#include <mutex>
#include <string>
#include "atomic_workbench_text_core.hpp"

namespace {
std::mutex engine_mutex;
std::unique_ptr<duo_text::Engine> engine;

std::string ReadBytes(JNIEnv* environment, jbyteArray value, bool path) {
    if (value == nullptr) throw std::invalid_argument("INVALID_BYTES");
    const jsize length = environment->GetArrayLength(value);
    if (length < 0 || static_cast<size_t>(length) > duo_text::kMaximumUtf8Bytes)
        throw std::invalid_argument("INPUT_TOO_LONG");
    std::string text(static_cast<size_t>(length), '\0');
    if (length != 0) environment->GetByteArrayRegion(value, 0, length, reinterpret_cast<jbyte*>(&text[0]));
    if (environment->ExceptionCheck()) throw std::runtime_error("JNI_BYTE_READ_FAILED");
    duo_text::Utf8Boundaries(text);
    if (path && (text.empty() || text.find('\0') != std::string::npos))
        throw std::invalid_argument("INVALID_PATH");
    return text;
}

void Fail(JNIEnv* environment, const char* fixed_code) {
    if (environment->ExceptionCheck()) return;
    jclass type = environment->FindClass("java/lang/IllegalStateException");
    if (type != nullptr) environment->ThrowNew(type, fixed_code);
}
}  // namespace

extern "C" JNIEXPORT jboolean JNICALL
Java_ls_augment_com_AtomicWorkbenchTextSegmenter_nativeInitialize(
        JNIEnv* environment, jclass, jbyteArray dictionary, jbyteArray hmm, jbyteArray user) {
    try {
        const auto dictionary_path = ReadBytes(environment, dictionary, true);
        const auto hmm_path = ReadBytes(environment, hmm, true);
        const auto user_path = ReadBytes(environment, user, true);
        std::lock_guard<std::mutex> held(engine_mutex);
        // Initialization/retry publishes only a completely constructed engine.
        // A failed retry must not leave the previous native READY state behind.
        engine.reset();
        auto replacement = std::make_unique<duo_text::Engine>(dictionary_path, hmm_path, user_path);
        engine = std::move(replacement);
        return JNI_TRUE;
    } catch (...) {
        Fail(environment, "TEXT_NATIVE_INITIALIZATION_FAILED");
        return JNI_FALSE;
    }
}

extern "C" JNIEXPORT jboolean JNICALL
Java_ls_augment_com_AtomicWorkbenchTextSegmenter_nativeReady(JNIEnv*, jclass) {
    try {
        std::lock_guard<std::mutex> held(engine_mutex);
        return engine ? JNI_TRUE : JNI_FALSE;
    } catch (...) { return JNI_FALSE; }
}

extern "C" JNIEXPORT jintArray JNICALL
Java_ls_augment_com_AtomicWorkbenchTextSegmenter_nativeCut(JNIEnv* environment, jclass, jbyteArray input) {
    try {
        const auto text = ReadBytes(environment, input, false);
        std::lock_guard<std::mutex> held(engine_mutex);
        if (!engine) throw std::runtime_error("TEXT_NATIVE_NOT_READY");
        const auto offsets = engine->Cut(text);
        jintArray result = environment->NewIntArray(static_cast<jsize>(offsets.size()));
        if (result != nullptr && !offsets.empty()) environment->SetIntArrayRegion(result, 0,
                static_cast<jsize>(offsets.size()), reinterpret_cast<const jint*>(offsets.data()));
        return result;
    } catch (...) {
        Fail(environment, "TEXT_NATIVE_SEGMENTATION_FAILED");
        return nullptr;
    }
}
