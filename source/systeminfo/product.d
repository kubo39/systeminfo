module systeminfo.product;

import std.file : readText;
import std.string : chop, stripRight;

string getProductName()
{
    return readText("/sys/devices/virtual/dmi/id/product_name").chop();
}

string getProductVendor()
{
    return readText("/sys/devices/virtual/dmi/id/sys_vendor").chop();
}

string getProductVersion()
{
    return readText("/sys/devices/virtual/dmi/id/product_version").stripRight();
}

string getProductSerial()
{
    return readText("/sys/devices/virtual/dmi/id/product_serial").chop();
}

string getProductFamily()
{
    return readText("/sys/devices/virtual/dmi/id/product_family").chop();
}

string getProductUUID()
{
    return readText("/sys/devices/virtual/dmi/id/product_uuid").chop();
}
