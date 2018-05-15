module systeminfo.system;

import std.process : pipeProcess, Redirect, wait;
import std.stdio : readln;
import std.string : chop;

string getKernelVersion()
{
    auto pipes = pipeProcess(["uname", "-mrv"], Redirect.stdout);
    scope(exit) wait(pipes.pid);
    return pipes.stdout.readln.chop;
}

string getOSInfo()
{
    auto pipes = pipeProcess(["lsb_release", "-ds"], Redirect.stdout);
    scope(exit) wait(pipes.pid);
    return pipes.stdout.readln.chop;
}
