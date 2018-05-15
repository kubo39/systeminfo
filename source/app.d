import std.conv : to;
import std.format : format;
import std.stdio : writefln, writeln;

import systeminfo.cpu;
import systeminfo.device;
import systeminfo.disk;
import systeminfo.memory;
import systeminfo.system;

void main()
{
    auto processorInfo = new ProcessorInfo();
    writeln("CPU情報: ", processorInfo.processor);
    writefln("CPUコア数: %d", processorInfo.totalCPUs);

    writefln("メモリ容量: %d (kB)", getTotalRAM());

    foreach (blk; getBlocklist())
        writefln("ディスク容量: %d GB (%s)", getStorageSize(blk), findDiskTypeFromName(blk));

    writeln("カーネル: ", getKernelVersion());
    writeln("OS情報: ", getOSInfo());
    writeln("メーカー: ", getVendor());
    writeln("型番: ", getProductName());
}
