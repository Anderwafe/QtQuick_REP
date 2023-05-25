#include "processorinfo.h"
#include <QIODevice>
#include <QFile>
#include <QTextStream>

QString ProcessorInfo::GetCpuInfo()
{
    return cpuInfo;
}

void ProcessorInfo::SetCpuInfo(QString value)
{
    cpuInfo = value;
}

ProcessorInfo::ProcessorInfo()
{
    QFile file("/proc/cpuinfo");
    file.open(QIODevice::Text | QIODevice::ReadOnly);
    QTextStream in(&file);
    QString line = in.readLine();
    cpuInfo += line;
    line = in.readLine();
    while(!line.isNull())
    {
        cpuInfo += "\n";
        cpuInfo += line;
        line = in.readLine();
    }
    file.close();
    //qDebug() << cpuInfo;
}
