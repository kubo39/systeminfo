module systeminfo.memory;

ulong getTotalRAM()
{
    import std.conv : to;
    import std.stdio : File;
    import std.string : split, startsWith;

    ulong memTotal;

    foreach (line; File("/proc/meminfo").byLine())
    {
        if (line.startsWith("MemTotal"))
            memTotal = line.split(" ")[$-2].to!ulong;
    }
    return memTotal;
}
