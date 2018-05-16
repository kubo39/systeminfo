module systeminfo.network;

struct NetworkDevice
{
    string name;
    string macAddress;
}

NetworkDevice[] getNetworkInfo()
{
    import std.algorithm : map;
    import std.array : array;
    import std.file : dirEntries, SpanMode, readText;
    import std.path : baseName, buildPath;
    import std.string : chop;

    return dirEntries("/sys/class/net", SpanMode.shallow, true)
        .map!(a => NetworkDevice(a.baseName,
                                 readText(buildPath(a, "address")).chop()))
        .array;
}
