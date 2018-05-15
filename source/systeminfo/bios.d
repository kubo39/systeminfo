module systeminfo.bios;

import std.file : readText;
import std.string : chop;


string getBiosVendor()
{
    return readText("/sys/devices/virtual/dmi/id/bios_vendor").chop();
}

string getBiosVersion()
{
    return readText("/sys/devices/virtual/dmi/id/bios_version").chop();
}

string getBiosDate()
{
    return readText("/sys/devices/virtual/dmi/id/bios_date").chop();
}
