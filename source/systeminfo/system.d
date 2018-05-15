module systeminfo.system;

string getKernelVersion()
{
    import core.sys.posix.sys.utsname : uname, utsname;
    import std.exception : errnoEnforce;
    import std.format : format;

    utsname _utsname;
    int ret = uname(&_utsname);
    if (ret == -1)
        errnoEnforce(false, "uname(2) failed.");
    return format("%s %s %s %s", _utsname.sysname, _utsname.release,
                  _utsname.update, _utsname.machine);
}

string getOSInfo()
{
    import std.process : pipeProcess, Redirect, wait;
    import std.stdio : readln;
    import std.string : chop;

    auto pipes = pipeProcess(["lsb_release", "-ds"], Redirect.stdout);
    scope(exit) wait(pipes.pid);
    return pipes.stdout.readln.chop;
}
