#ifndef DUO_ATOMIC_WORKBENCH_TEXT_CORE_HPP
#define DUO_ATOMIC_WORKBENCH_TEXT_CORE_HPP

#include <cstdint>
#include <limits>
#include <memory>
#include <stdexcept>
#include <string>
#include <utility>
#include <vector>
#include "cppjieba/MixSegment.hpp"

namespace duo_text {

constexpr size_t kMaximumUtf8Bytes = 131072;

// Strict RFC-3629 UTF-8, including U+0000. Reject CESU-8/modified UTF-8,
// overlong sequences, surrogate code points and values above U+10FFFF.
inline std::vector<bool> Utf8Boundaries(const std::string& text) {
    if (text.size() > kMaximumUtf8Bytes) throw std::invalid_argument("INPUT_TOO_LONG");
    std::vector<bool> boundary(text.size() + 1, false);
    size_t cursor = 0;
    while (cursor < text.size()) {
        boundary[cursor] = true;
        const auto first = static_cast<uint8_t>(text[cursor]);
        uint32_t point;
        size_t width;
        if (first <= 0x7f) { point = first; width = 1; }
        else if (first >= 0xc2 && first <= 0xdf) { point = first & 0x1f; width = 2; }
        else if (first >= 0xe0 && first <= 0xef) { point = first & 0x0f; width = 3; }
        else if (first >= 0xf0 && first <= 0xf4) { point = first & 0x07; width = 4; }
        else throw std::invalid_argument("INVALID_UTF8");
        if (cursor + width > text.size()) throw std::invalid_argument("INVALID_UTF8");
        for (size_t i = 1; i < width; ++i) {
            const auto next = static_cast<uint8_t>(text[cursor + i]);
            if ((next & 0xc0) != 0x80) throw std::invalid_argument("INVALID_UTF8");
            point = (point << 6) | (next & 0x3f);
        }
        if ((width == 2 && point < 0x80) || (width == 3 && point < 0x800)
                || (width == 4 && point < 0x10000) || point > 0x10ffff
                || (point >= 0xd800 && point <= 0xdfff)) throw std::invalid_argument("INVALID_UTF8");
        cursor += width;
    }
    boundary[text.size()] = true;
    return boundary;
}

class Engine {
 public:
    Engine(const std::string& dictionary, const std::string& hmm, const std::string& user)
        : dictionary_(new cppjieba::DictTrie(dictionary, user)),
          model_(new cppjieba::HMMModel(hmm)),
          segmenter_(new cppjieba::MixSegment(dictionary_.get(), model_.get())) {}

    std::vector<int32_t> Cut(const std::string& text) const {
        const auto boundary = Utf8Boundaries(text);
        std::vector<cppjieba::Word> words;
        segmenter_->Cut(text, words, true);
        std::vector<int32_t> result;
        result.reserve(words.size() * 2);
        size_t cursor = 0;
        for (const auto& word : words) {
            const size_t begin = word.offset;
            const size_t end = begin + word.word.size();
            // Never invent missing tokens or search for a repeated substring.
            if (begin != cursor || begin >= end || end > text.size()
                    || !boundary[begin] || !boundary[end]
                    || text.compare(begin, end - begin, word.word) != 0)
                throw std::runtime_error("NATIVE_OFFSET_CONTRACT");
            result.push_back(static_cast<int32_t>(begin));
            result.push_back(static_cast<int32_t>(end));
            cursor = end;
        }
        if (cursor != text.size()) throw std::runtime_error("NATIVE_OFFSET_CONTRACT");
        return result;
    }

 private:
    std::unique_ptr<cppjieba::DictTrie> dictionary_;
    std::unique_ptr<cppjieba::HMMModel> model_;
    std::unique_ptr<cppjieba::MixSegment> segmenter_;
};

}  // namespace duo_text
#endif
