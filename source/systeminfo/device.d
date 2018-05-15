module systeminfo.device;

import std.file : readText;
import std.string : chop;

string getProductName()
{
    return readText("/sys/devices/virtual/dmi/id/product_name").chop();
}

string getVendor()
{
    return readText("/sys/devices/virtual/dmi/id/sys_vendor").chop();
}
