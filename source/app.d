import std.conv : to;
import std.format : format;
import std.stdio : writefln, writeln;

import systeminfo.bios;
import systeminfo.cpu;
import systeminfo.disk;
import systeminfo.memory;
import systeminfo.product;
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
    writeln("製品メーカー: ", getProductVendor());
    writeln("型番: ", getProductName());
    writeln("BIOSメーカー: ", getBiosVendor());
    writeln("BIOSバージョン: ", getBiosVersion());
    writeln("BIOS製造日: ", getBiosDate());
}
