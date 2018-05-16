module systeminfo.chassis;

import std.file : readText;
import std.string : chop, stripRight;

string getChassisType()
{
    return readText("/sys/devices/virtual/dmi/id/chassis_type").chop();
}

string getChassisVendor()
{
    return readText("/sys/devices/virtual/dmi/id/chassis_vendor").chop();
}

string getChassisVersion()
{
    return readText("/sys/devices/virtual/dmi/id/chassis_version").stripRight();
}

string getChassisAssetTag()
{
    return readText("/sys/devices/virtual/dmi/id/chassis_asset_tag").chop();
}

string getChassisSerial()
{
    return readText("/sys/devices/virtual/dmi/id/chassis_serial").chop();
}
