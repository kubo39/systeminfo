module systeminfo.product;

import std.file : readText;
import std.string : chop;

string getProductName()
{
    return readText("/sys/devices/virtual/dmi/id/product_name").chop();
}

string getProductVendor()
{
    return readText("/sys/devices/virtual/dmi/id/sys_vendor").chop();
}
