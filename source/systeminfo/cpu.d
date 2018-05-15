module systeminfo.cpu;

import std.format : format;
import std.stdio : File;
import std.string : chop, split, startsWith;

class ProcessorInfo
{
private:
    string modelName;
    ulong numOfProcessors;

public:

    this(string modelName, ulong numOfProcessors)
    {
        this.modelName = modelName;
        this.numOfProcessors = numOfProcessors;
    }

    this()
    {
        import std.parallelism : totalCPUs;
        ulong numOfProcessors = totalCPUs;
        string modelName;
        bool modelNameSeen = false;

        auto f = File("/proc/cpuinfo");
        foreach (line; f.byLineCopy())
        {
            // Get model name only once.
            if (line.startsWith("model name") && !modelNameSeen)
            {
                modelName = cast(immutable) line.split(": ")[1];
                modelNameSeen = true;
            }
        }
        this(modelName, numOfProcessors);
    }

    string modelname() @property
    {
        return this.modelName;
    }

    ulong totalCPUs() @property
    {
        return this.numOfProcessors;
    }

    override string toString()
    {
        return format("%s   numOfProcessors: %d", this.modelName, this.numOfProcessors);
    }
}

