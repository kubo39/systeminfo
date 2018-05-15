module systeminfo.memory;

import std.conv : to;
import std.file : readText;
import std.string : chop, split, startsWith;

ulong getTotalRAM()
{
    ulong memTotal;
    foreach (line; readText("/proc/meminfo").chop().split("\n"))
    {
        if (line.startsWith("MemTotal"))
            memTotal = line.split(" ")[$-2].to!ulong;
    }
    return memTotal;
}
