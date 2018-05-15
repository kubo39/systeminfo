module systeminfo.disk;

import std.conv : to;
import std.file : readText;
import std.format : format;
import std.string : chop;

enum DiskType
{
    HDD = 1,
    SSD,
}

DiskType findDiskTypeFromName(string name)
{
    auto rotational = readText(format("/sys/block/%s/queue/rotational", name)).chop();
    return cast(DiskType) rotational.to!int;
}

ulong getStorageSize(string name)
{
    auto size = readText(format("/sys/block/%s/size", name)).chop();
    auto gb = size.to!ulong * 512.0 / (1000.0 * 1000.0 * 1000.0);
    return gb.to!ulong;
}
