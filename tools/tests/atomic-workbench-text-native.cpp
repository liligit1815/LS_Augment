#include <iostream>
#include <fstream>
#include <stdexcept>
#include <string>
#include <vector>
#include "atomic_workbench_text_core.hpp"

namespace {
int checks = 0;
void Check(bool value, const char* code) {
    ++checks;
    if (!value) throw std::runtime_error(code);
}
std::vector<std::string> Words(duo_text::Engine& engine, const std::string& text) {
    const auto offsets = engine.Cut(text);
    Check(offsets.size() % 2 == 0, "PAIR_COUNT");
    std::vector<std::string> words;
    std::string joined;
    for (size_t i = 0; i < offsets.size(); i += 2) {
        words.push_back(text.substr(offsets[i], offsets[i + 1] - offsets[i])); joined += words.back();
    }
    Check(joined == text, "LOSSLESS_SOURCE");
    return words;
}
void InvalidUtf8(const std::string& text) {
    bool rejected = false;
    try { duo_text::Utf8Boundaries(text); } catch (const std::invalid_argument&) { rejected = true; }
    Check(rejected, "MALFORMED_UTF8_ACCEPTED");
}
}  // namespace

int main(int argc, char** argv) {
    try {
        Check(argc == 3, "EXPECTED_DICT_AND_TEMP_DIRECTORIES");
        std::string directory = argv[1], temporary = argv[2];
        duo_text::Engine engine(directory + "/jieba.dict.utf8", directory + "/hmm_model.utf8", directory + "/user.dict.utf8");
        Check(Words(engine, u8"南京市长江大桥") == std::vector<std::string>({u8"南京市", u8"长江大桥"}), "TRUE_DICTIONARY_SEGMENTATION");
        Check(Words(engine, u8"我爱北京天安门") == std::vector<std::string>({u8"我", u8"爱", u8"北京", u8"天安门"}), "TRUE_CHINESE_SEGMENTATION");
        Check(Words(engine, u8"云计算区块链") == std::vector<std::string>({u8"云计算", u8"区块链"}), "TRUE_USER_DICTIONARY");
        for (const auto& text : std::vector<std::string>{"", " \t\r\n\n", "abc123, 42.5!", u8"你好，世界！\n\n🙂𠀀𠀁", u8"é👨‍👩‍👧‍👦", std::string("A\0B", 3)}) {
            Words(engine, text);
        }
        const auto emoji = engine.Cut(u8"🙂𠀀");
        const auto boundaries = duo_text::Utf8Boundaries(u8"🙂𠀀");
        Check(boundaries.size() == 9 && boundaries[0] && boundaries[4] && boundaries[8], "STANDARD_FOUR_BYTE_UTF8");
        for (int32_t value : emoji) Check(value == 0 || value == 4 || value == 8, "NON_BMP_BOUNDARY");
        InvalidUtf8(std::string("\xc0\x80", 2));  // modified UTF-8 NUL
        InvalidUtf8(std::string("\xed\xa0\x80", 3));  // surrogate/CESU-8
        InvalidUtf8(std::string("\xf4\x90\x80\x80", 4));
        InvalidUtf8(std::string("\xe2\x82", 2));
        InvalidUtf8(std::string("\x80", 1));
        InvalidUtf8(std::string("\xf8\x80\x80\x80\x80", 5));
        bool too_long = false;
        try { engine.Cut(std::string(duo_text::kMaximumUtf8Bytes + 1, 'x')); } catch (const std::invalid_argument&) { too_long = true; }
        Check(too_long, "INPUT_BOUND");
        bool missing = false;
        try { duo_text::Engine broken(temporary + "/missing", directory + "/hmm_model.utf8", ""); }
        catch (const std::exception& error) { missing = std::string(error.what()) == "CPPJIEBA_DATA_ERROR"; }
        Check(missing, "MISSING_DICT_FIXED_EXCEPTION_NO_ABORT");
        std::ofstream empty(temporary + "/empty"); empty.close();
        bool damaged = false;
        try { duo_text::Engine broken(directory + "/jieba.dict.utf8", temporary + "/empty", ""); }
        catch (const std::exception& error) { damaged = std::string(error.what()) == "CPPJIEBA_DATA_ERROR"; }
        Check(damaged, "EMPTY_HMM_FIXED_EXCEPTION_NO_ABORT");
        Check(!engine.Cut(u8"损坏初始化后原引擎仍可用").empty(), "EXISTING_ENGINE_PRESERVED");
        // No corpus, dictionary text or file path is printed, even in a negative case.
        std::cout << "PASS actual_cppjieba_native checks=" << checks << std::endl;
        return 0;
    } catch (const std::exception&) {
        std::cerr << "FAIL_NATIVE_TEST" << std::endl; return 1;
    }
}
