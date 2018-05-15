import std.conv : to;
import std.format : format;
import std.stdio : writeln;

import systeminfo.cpu;
import systeminfo.device;
import systeminfo.disk;
import systeminfo.memory;
import systeminfo.system;

void main()
{
    auto processorInfo = new ProcessorInfo();
    writeln("CPU情報: ", processorInfo.modelname);
    writeln("CPUコア数: ", processorInfo.totalCPUs);
    writeln("メモリ容量: ", getTotalRAM());
    writeln(format("ディスク容量: %s (%s)", getStorageSize("sda"), findDiskTypeFromName("sda")));
    writeln("Linuxカーネル: ", getKernelVersion());
    writeln("OS情報: ", getOSInfo());
    writeln("メーカー: ", getVendor());
    writeln("型番: ", getProductName());
}
