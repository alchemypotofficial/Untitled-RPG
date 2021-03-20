const unsigned char tilemap_1[256] = 
{
    0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0,
    1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1
};

const unsigned char tilemap_2[256] = 
{
    0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1,
    1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0
};

const unsigned char tilemap_3[256] = 
{
    0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1,
    0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1,
};

const unsigned char Tileset_1_Map[60][4] =
{
    {0x00, 0x00, 0x00, 0x00}, {0x01, 0x03, 0x02, 0x04}, // 0, 1
    {0x05, 0x07, 0x06, 0x08}, {0x09, 0x0B, 0x0A, 0x0C}, // 2, 3
    {0x0D, 0x0F, 0x0E, 0x10}, {0x11, 0x13, 0x12, 0x14}, // 4, 5
    {0x15, 0x17, 0x16, 0x18}, {0x19, 0x1B, 0x1A, 0x1C}, // 6, 7
    {0x1D, 0x1F, 0x1E, 0x20}, {0x21, 0x23, 0x22, 0x24}, // 8, 9
    {0x25, 0x27, 0x26, 0x28}, {0x29, 0x2B, 0x2A, 0x2C}, // 10, 11
    {0x2D, 0x2F, 0x2E, 0x30}, {0x31, 0x00, 0x32, 0x33}, // 12, 13
    {0x34, 0x36, 0x35, 0x37}, {0x00, 0x39, 0x38, 0x3A}, // 14, 15
    {0x3B, 0x3D, 0x3C, 0x3E}, {0x3F, 0x41, 0x40, 0x42}, // 16, 17
    {0x43, 0x45, 0x44, 0x46}, {0x47, 0x49, 0x48, 0x4A}, // 18, 19
    {0x4B, 0x4D, 0x4C, 0x4E}, {0x4F, 0x51, 0x50, 0x52}, // 20, 21
    {0x53, 0x55, 0x54, 0x56}, {0x57, 0x59, 0x58, 0x5A}, // 22, 23
    {0x5B, 0x5D, 0x5C, 0x5E}, {0x5F, 0x61, 0x60, 0x62}, // 24, 25
    {0x63, 0x65, 0x64, 0x66}, {0x67, 0x69, 0x68, 0x6A}, // 26, 27
    {0x6B, 0x6D, 0x6C, 0x6E}, {0x6F, 0x71, 0x70, 0x72}, // 28, 29
    {0x73, 0x75, 0x74, 0x76}, {0x77, 0x79, 0x78, 0x7A}, // 30, 31
    {0x7B, 0x7C, 0x00, 0x7D}, {0x7E, 0x80, 0x7F, 0x81}, // 32, 33
    {0x82, 0x84, 0x83, 0x00}, {0x85, 0x87, 0x86, 0x88}, // 34, 35
    {0x89, 0x8B, 0x8A, 0x8C}, {0x8D, 0x8F, 0x8E, 0x90}, // 36, 37
    {0x91, 0x93, 0x92, 0x94}, {0x95, 0x97, 0x96, 0x98}, // 38, 39
    {0x99, 0x9B, 0x9A, 0x9C}, {0xA5, 0xA7, 0xA6, 0xA8}, // 40, 41
    {0x9D, 0x9F, 0x9E, 0xA8}, {0xB3, 0xA7, 0xB4, 0xB6}, // 42, 43
    {0xAF, 0xB1, 0xA6, 0xB2}, {0xA5, 0xB9, 0xB8, 0xBA}, // 44, 45
    {0xA9, 0xAA, 0xA6, 0xA8}, {0xA5, 0xAB, 0xA6, 0xAC}, // 46, 47
    {0xA5, 0xA7, 0xBB, 0xBC}, {0xAD, 0xA7, 0xAE, 0xA8}, // 48, 49
    {0xA1, 0xA7, 0xA6, 0xA8}, {0xA5, 0xA3, 0xA6, 0xA8}, // 50, 51
    {0xA5, 0xA7, 0xA2, 0xA8}, {0xA5, 0xA7, 0xA6, 0xA4}, // 52, 53
    {0xA5, 0xA3, 0xA2, 0xA8}, {0xA1, 0xA7, 0xA6, 0xA4}, // 54, 55
    {0xBD, 0xBD, 0xBE, 0xBE}, {0xBF, 0xBF, 0xBF, 0xBF}, // 56, 57
    {0xC4, 0xC6, 0xC5, 0xC7}, {0xC8, 0xCA, 0xC9, 0xCB} // 58, 59
};

const unsigned char Tileset_2_Map[60][4] =
{
    {0x00, 0x00, 0x00, 0x00}, {0x02, 0x04, 0x01, 0x03}, // 0, 1
    {0x05, 0x07, 0x06, 0x08}, {0x09, 0x0B, 0x0A, 0x0C}, // 2, 3
    {0x0D, 0x0F, 0x0E, 0x11}, {0x10, 0x12, 0x07, 0x15}, // 4, 5
    {0x14, 0x16, 0x09, 0x17}, {0x07, 0x09, 0x08, 0x0A}, // 6, 7
    {0x1B, 0x1B, 0x1B, 0x1B}, {0x1B, 0x1B, 0x1B, 0x1C}, // 8, 9
    {0x1B, 0x1B, 0x22, 0x22}, {0x1B, 0x1B, 0x1F, 0x1B}, // 10, 11
    {0x1B, 0x20, 0x1B, 0x20}, {0x1D, 0x1B, 0x1D, 0x1B}, // 12, 13
    {0x1E, 0x1E, 0x1B, 0x1B}, {0x23, 0x1B, 0x1B, 0x1B}, // 14, 15
    {0x1B, 0x21, 0x1B, 0x1B}, {0x23, 0x21, 0x1B, 0x1B}, // 16, 17
    {0x1B, 0x1B, 0x1F, 0x1C}, {0x1D, 0x20, 0x1D, 0x20}, // 18, 19
    {0x1E, 0x1E, 0x22, 0x22}, {0x1D, 0x20, 0x25, 0x27}, // 20, 21
    {0x24, 0x26, 0x1D, 0x20}, {0x29, 0x28, 0x05, 0x0B}, // 22, 23
    {0x05, 0x0B, 0x06, 0x0C}, {0x11, 0x09, 0x2A, 0x2C}, // 24, 25
    {0x2B, 0x2D, 0x2E, 0x30}, {0x2F, 0x31, 0x01, 0x03}, // 26, 27
    {0x32, 0x34, 0x33, 0x35}, {0x36, 0x38, 0x37, 0x39}, // 28, 29
    {0x07, 0x09, 0x3A, 0x3C}, {0x3B, 0x3D, 0x3E, 0x3F}, // 30, 31
    {0x40, 0x42, 0x41, 0x43}, {0x44, 0x46, 0x45, 0x47}, // 32, 33
    {0x48, 0x4A, 0x49, 0x4B}, {0x4C, 0x4E, 0x4D, 0x4F}, // 34, 35
    {0x4E, 0x50, 0x4F, 0x51}, {0x52, 0x54, 0x53, 0x55}, // 36, 37
    {0x58, 0x56, 0x59, 0x57}, {0x4C, 0x5A, 0x4D, 0x5B}, // 38, 39
    {0x5C, 0x50, 0x5D, 0x51}, {0x68, 0x6A, 0x69, 0x6B}, // 40, 41
    {0x5E, 0x60, 0x5F, 0x61}, {0x62, 0x63, 0x62, 0x63}, // 42, 43
    {0x64, 0x66, 0x65, 0x67}, {0x6C, 0x6E, 0x6D, 0x6F}, // 44, 45
    {0x70, 0x72, 0x71, 0x73}, {0x74, 0x76, 0x75, 0x77}, // 46, 47
    {0x78, 0x7A, 0x79, 0x7B}, {0x7C, 0x7E, 0x7D, 0x7F}, // 48, 49
    {0x80, 0x82, 0x81, 0x83}, {0x84, 0x85, 0x01, 0x03}, // 50, 51
    {0x85, 0x86, 0x01, 0x03}, {0x86, 0x87, 0x01, 0x03}, // 52, 53
    {0x4C, 0x4E, 0x52, 0x54}, {0x4E, 0x4E, 0x54, 0x58}, // 54, 55
    {0x4E, 0x50, 0x58, 0x56}, {0x88, 0x8A, 0x89, 0x8B}, // 56, 57
    {0x8C, 0x8E, 0x8D, 0x8F}, {0x90, 0x92, 0x91, 0x93}, // 58, 59
};

const unsigned char Tileset_3_Map[60][4] =
{
    {0x00, 0x00, 0x00, 0x00}, {0x01, 0x03, 0x02, 0x04}, // 0, 1
    {0x05, 0x07, 0x06, 0x08}, {0x24, 0x26, 0x25, 0x27}, // 2, 3
    {0x28, 0x28, 0x29, 0x29}, {0x10, 0x12, 0x07, 0x15}, // 4, 5
    {0x14, 0x16, 0x09, 0x17}, {0x07, 0x09, 0x08, 0x0A}, // 6, 7
    {0x1B, 0x1B, 0x1B, 0x1B}, {0x1B, 0x1B, 0x1B, 0x1C}, // 8, 9
    {0x1B, 0x1B, 0x22, 0x22}, {0x1B, 0x1B, 0x1F, 0x1B}, // 10, 11
    {0x1B, 0x20, 0x1B, 0x20}, {0x1D, 0x1B, 0x1D, 0x1B}, // 12, 13
    {0x1E, 0x1E, 0x1B, 0x1B}, {0x23, 0x1B, 0x1B, 0x1B}, // 14, 15
    {0x1B, 0x21, 0x1B, 0x1B}, {0x23, 0x21, 0x1B, 0x1B}, // 16, 17
    {0x2A, 0x2C, 0x2B, 0x2D}, {0x36, 0x38, 0x2B, 0x2D}, // 18, 19
    {0x2A, 0x2C, 0x37, 0x39}, {0x2A, 0x30, 0x2B, 0x31}, // 20, 21
    {0x2E, 0x2C, 0x2F, 0x2D}, {0x2A, 0x2C, 0x2B, 0x3D}, // 22, 23
    {0x2A, 0x3C, 0x2B, 0x2D}, {0x2A, 0x2C, 0x3B, 0x2D}, // 24, 25
    {0x3A, 0x2C, 0x2B, 0x2D}, {0x2A, 0x2C, 0x3B, 0x3D}, // 26, 27
    {0x3A, 0x3C, 0x2B, 0x2D}, {0x32, 0x38, 0x2F, 0x2D}, // 28, 29
    {0x36, 0x34, 0x2B, 0x31}, {0x2E, 0x2C, 0x33, 0x39}, // 30, 31
    {0x2A, 0x30, 0x37, 0x35}, {0x2E, 0x30, 0x33, 0x35}, // 32, 33
    {0x32, 0x34, 0x2F, 0x31}, {0x36, 0x34, 0x37, 0x35}, // 34, 35
    {0x32, 0x38, 0x33, 0x39}, {0x52, 0x54, 0x53, 0x55}, // 36, 37
    {0x58, 0x56, 0x59, 0x57}, {0x4C, 0x5A, 0x4D, 0x5B}, // 38, 39
    {0x5C, 0x50, 0x5D, 0x51}, {0x68, 0x6A, 0x69, 0x6B}, // 40, 41
    {0x5E, 0x60, 0x5F, 0x61}, {0x62, 0x63, 0x62, 0x63}, // 42, 43
    {0x64, 0x66, 0x65, 0x67}, {0x6C, 0x6E, 0x6D, 0x6F}, // 44, 45
    {0x70, 0x72, 0x71, 0x73}, {0x74, 0x76, 0x75, 0x77}, // 46, 47
    {0x78, 0x7A, 0x79, 0x7B}, {0x7C, 0x7E, 0x7D, 0x7F}, // 48, 49
    {0xA1, 0xA7, 0xA6, 0xA8}, {0xA5, 0xA3, 0xA6, 0xA8}, // 50, 51
    {0xA5, 0xA7, 0xA2, 0xA8}, {0xA5, 0xA7, 0xA6, 0xA4}, // 52, 53
    {0xA5, 0xA3, 0xA2, 0xA8}, {0xA1, 0xA7, 0xA6, 0xA4}, // 54, 55
    {0xBD, 0xBD, 0xBE, 0xBE}, {0xBF, 0xBF, 0xBF, 0xBF} // 56, 57
};