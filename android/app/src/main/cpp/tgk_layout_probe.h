#pragma once
#include <cstddef>
#include <cstdint>
#include <cstring>

namespace tgk_layout {
// Structural compatibility only. No model, release or file-hash allowlist.
struct Layout {
    int firstKey, secondKey;
    size_t firstCount, firstDown, firstUp, secondCount, secondDown, secondUp;
};
constexpr uint32_t kPattern[] = {
0xd503233f, 0xa9be7bfd, 0xf9000bf3, 0x910003fd, 0x7102283f, 0xaa0003f3,
        0x540001a0, 0x7102243f, 0x54000941, 0xb9406268, 0x7100191f, 0x5400024b,
        0xf9400268, 0x529c2001, 0x529c3802, 0xaa1303e0, 0x72a0bea1, 0x72a01c82,
        0x14000025, 0xb9406668, 0x7100191f, 0x5400022b, 0xf9400268, 0x529c2001,
        0x529c3802, 0xaa1303e0, 0x72a0bea1, 0x72a01c82, 0x14000028, 0x71000d1f,
        0x5400022b, 0xf9400268, 0x52984001, 0x529e1002, 0xaa1303e0, 0x72a17d61,
        0x72a05f42, 0x14000012, 0x71000d1f, 0x540002ab, 0xf9400268, 0x52984001,
        0x529e1002, 0xaa1303e0, 0x72a17d61, 0x72a05f42, 0x14000016, 0x7100051f,
        0x540004cb, 0xf9400268, 0x528ca001, 0x52984002, 0xaa1303e0, 0x72a3b9a1,
        0x72a17d62, 0xf9403d08, 0xd63f0100, 0x52800a88, 0x52800a09, 0x1400000d,
        0x7100051f, 0x5400036b, 0xf9400268, 0x528ca001, 0x52984002, 0xaa1303e0,
        0x72a3b9a1, 0x72a17d62, 0xf9403d08, 0xd63f0100, 0x52800b88, 0x52800b09,
        0x528cccea, 0x72acccca, 0x9b2a7c0a, 0xd37ffd4b, 0x9361fd4a, 0x0b0b014a,
        0x531f794b, 0x0b0a016a, 0xb8296a6a, 0xb8286a6b, 0xf9400bf3, 0xa8c27bfd,
        0xd50323bf, 0xd65f03c0, 0x2a1f03e0, 0x17ffffe2, 0x2a1f03e0, 0x17ffffed,
};

inline uint32_t word(const uint8_t* bytes, size_t index) {
    uint32_t value;
    std::memcpy(&value, bytes + index * 4, sizeof(value));
    return value;
}

inline bool inspect(const uint8_t* bytes, size_t size, Layout* result) {
    if (bytes == nullptr || result == nullptr || size < 4) return false;
    size_t prefix = word(bytes, 0) == 0xd503245f ? 4 : 0;
    if (size != sizeof(kPattern) + prefix) return false;
    bytes += prefix;
    uint32_t code[sizeof(kPattern) / sizeof(uint32_t)];
    for (size_t i = 0; i < sizeof(code) / sizeof(uint32_t); ++i) {
        code[i] = word(bytes, i);
        uint32_t mask = 0xffffffff;
        if (i == 4 || i == 7 || i == 9 || i == 19) mask = ~0x003ffc00U;
        if (i == 57 || i == 58 || i == 70 || i == 71) mask = ~0x001fffe0U;
        if ((code[i] & mask) != (kPattern[i] & mask)) return false;
    }
    Layout layout{
            static_cast<int>((code[7] >> 10) & 4095),
            static_cast<int>((code[4] >> 10) & 4095),
            ((code[9] >> 10) & 4095) * 4U, (code[58] >> 5) & 65535U, (code[57] >> 5) & 65535U,
            ((code[19] >> 10) & 4095) * 4U, (code[71] >> 5) & 65535U, (code[70] >> 5) & 65535U};
    if (layout.firstKey == 0 || layout.secondKey == 0 || layout.firstKey == layout.secondKey) return false;
    const size_t offsets[] = {layout.firstCount, layout.firstDown, layout.firstUp,
            layout.secondCount, layout.secondDown, layout.secondUp};
    for (size_t i = 0; i < 6; ++i) {
        if (offsets[i] < 16 || offsets[i] > 1024 || offsets[i] % 4 != 0) return false;
        for (size_t j = 0; j < i; ++j) if (offsets[j] == offsets[i]) return false;
    }
    *result = layout;
    return true;
}
} // namespace tgk_layout

