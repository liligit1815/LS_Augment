#include "../android/app/src/main/cpp/tgk_layout_probe.h"
#include <cstdio>
#include <initializer_list>

int main() {
    uint32_t code[90];
    std::memcpy(code, tgk_layout::kPattern, sizeof(code));
    tgk_layout::Layout layout{};
    if (!tgk_layout::inspect(reinterpret_cast<uint8_t*>(code), sizeof(code), &layout)
            || layout.firstKey != 137 || layout.firstCount != 0x60) return 1;
    for (int index : {9, 19}) code[index] += (0x80 / 4 << 10);
    for (int index : {57, 58, 70, 71}) code[index] += (0x80 << 5);
    if (!tgk_layout::inspect(reinterpret_cast<uint8_t*>(code), sizeof(code), &layout)
            || layout.firstCount != 0xe0 || layout.secondUp != 0xdc) return 2;
    code[57] -= (4 << 5);
    if (tgk_layout::inspect(reinterpret_cast<uint8_t*>(code), sizeof(code), &layout)) return 3;
    std::memcpy(code, tgk_layout::kPattern, sizeof(code));
    code[80] ^= 16;
    if (tgk_layout::inspect(reinterpret_cast<uint8_t*>(code), sizeof(code), &layout)) return 4;
    std::puts("PASS native structural layout probe");
    return 0;
}
