#include "../android/app/src/main/cpp/tgk_layout_probe.h"
#include <cstdio>
#include <cstdlib>
#include <vector>

void check(bool value, const char* message) {
    if (!value) { std::fprintf(stderr, "FAIL %s\n", message); std::exit(1); }
}
bool inspect(const std::vector<uint32_t>& words, tgk_layout::Layout* layout) {
    return tgk_layout::inspect(reinterpret_cast<const uint8_t*>(words.data()), words.size() * 4, layout);
}
void verify(const uint32_t* words, size_t count, bool paired) {
    std::vector<uint32_t> original(words, words + count), changed(original);
    tgk_layout::Layout layout{};
    check(inspect(original, &layout) && layout.firstKey == 137 && layout.secondKey == 138
            && layout.firstCount == 96 && layout.secondCount == 100 && layout.firstDown == 80
            && layout.firstUp == 84 && layout.secondDown == 88 && layout.secondUp == 92, "complete layout");
    changed.insert(changed.begin(), 0xd503245f);
    check(inspect(changed, &layout), "optional BTI");
    changed = original;
    for (int i : {9, 19}) changed[i] += (0x80 / 4 << 10);
    for (int i : {4, 7}) changed[i] += (20 << 10);
    if (paired) for (int i : {65, 85}) changed[i] += (0x80 / 4 << 15);
    else for (int i : {57, 58, 70, 71}) changed[i] += (0x80 << 5);
    check(inspect(changed, &layout) && layout.firstKey == 157 && layout.firstCount == 224
            && layout.firstDown == 208 && layout.secondUp == 220, "derive new fields and keys");
    if (paired) changed[85] = changed[65];
    else changed[57] -= (4 << 5);
    check(!inspect(changed, &layout), "overlapping fields rejected");
    changed = original;
    changed[7] = changed[4];
    check(!inspect(changed, &layout), "duplicate keys rejected");
    if (paired) {
        changed = original;
        changed[65] = (changed[65] & ~0x003f8000U) | (127U << 15);
        check(!inspect(changed, &layout), "negative STP displacement rejected");
    }
    for (size_t i = 0; i < count; ++i) {
        uint32_t variable = 0;
        if (i == 4 || i == 7 || i == 9 || i == 19) variable = 0x003ffc00U;
        if (!paired && (i == 57 || i == 58 || i == 70 || i == 71)) variable = 0x001fffe0U;
        if (paired && (i == 65 || i == 85)) variable = 0x003f8000U;
        for (unsigned bit = 0; bit < 32; ++bit) {
            if (variable & (1U << bit)) continue;
            changed = original;
            changed[i] ^= 1U << bit;
            check(!inspect(changed, &layout), "every fixed instruction bit rejects mutation");
        }
    }
}
int main(int argc, char** argv) {
    verify(tgk_layout::kPattern, sizeof(tgk_layout::kPattern) / 4, false);
    verify(tgk_layout::kPairedStorePattern, sizeof(tgk_layout::kPairedStorePattern) / 4, true);
    tgk_layout::Layout layout{};
    std::vector<uint32_t> padded(tgk_layout::kPattern, tgk_layout::kPattern + 90);
    padded.resize(94);
    check(!inspect(padded, &layout), "length alone is insufficient");
    for (int i = 1; i < argc; ++i) {
        FILE* file = std::fopen(argv[i], "rb");
        check(file != nullptr, "open real extracted function");
        std::vector<uint8_t> bytes;
        int byte;
        while ((byte = std::fgetc(file)) != EOF) bytes.push_back(static_cast<uint8_t>(byte));
        std::fclose(file);
        check(tgk_layout::inspect(bytes.data(), bytes.size(), &layout), "real OEM function accepted");
    }
    std::puts("PASS native structural layouts: both templates, fixed-bit mutations and OEM functions");
}
