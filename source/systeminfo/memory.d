module systeminfo.memory;

import std.file : readText;
import std.string : chop, split, startsWith;

string getTotalRAM()
{
    string memTotal;
    foreach (line; readText("/proc/meminfo").chop().split("\n"))
    {
        if (line.startsWith("MemTotal"))
            memTotal = line.split(": ")[1];
    }
    return memTotal;
}

