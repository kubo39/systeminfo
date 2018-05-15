module systeminfo.cpu;

class ProcessorInfo
{
    string processor() @property
    {
        import core.cpuid;
        return core.cpuid.processor;
    }

    ulong totalCPUs() @property
    {
        import std.parallelism : totalCPUs;
        return totalCPUs;
    }

    override string toString()
    {
        import std.format : format;
        return format("%s   numOfProcessors: %d", this.processor, this.totalCPUs);
    }
}

