module systeminfo.board;

import std.file : readText;
import std.string : chop;

string getBoardName()
{
    return readText("/sys/devices/virtual/dmi/id/board_name").chop();
}

string getBoardVendor()
{
    return readText("/sys/devices/virtual/dmi/id/board_vendor").chop();
}

string getBoardVersion()
{
    return readText("/sys/devices/virtual/dmi/id/board_version").chop();
}
