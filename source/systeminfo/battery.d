module systeminfo.battery;

import std.file : readText;
import std.string :chop;

string getBatteryTechnology()
{
    return readText("/sys/class/power_supply/BAT0/technology").chop();
}

string getBatteryModelName()
{
    return readText("/sys/class/power_supply/BAT0/model_name").chop();
}

bool hasBattery()
{
    import std.algorithm : any, filter, map;
    import std.file : dirEntries, readText, SpanMode;
    import std.path : baseName;
    import std.string : chop, cmp;

    return dirEntries("/sys/class/power_supply", SpanMode.shallow)
        .map!(a => a.name)
        .any!(powerSupply =>
              powerSupply.dirEntries(SpanMode.depth, false)
              .filter!(a => a.isFile)
              .map!(a => a.name)
              .filter!(a => a.baseName.cmp("type") == 0)
              .any!(a => a.readText().chop().cmp("Battery") == 0)
            );
}
