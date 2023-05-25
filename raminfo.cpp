#include "raminfo.h"
#include <QIODevice>
#include <QFile>
#include <QTextStream>

QString RAMInfo::GetRAMInfo()
{
    return ramInfo;
}

void RAMInfo::SetRAMInfo(QString value)
{
    ramInfo = value;
}

RAMInfo::RAMInfo()
{
    QFile file("/proc/meminfo");
    file.open(QIODevice::Text | QIODevice::ReadOnly);
    QTextStream in(&file);
    QString line = in.readLine();
    ramInfo += line;
    line = in.readLine();
    while(!line.isNull())
    {
        ramInfo += "\n";
        ramInfo += line;
        line = in.readLine();
    }
    file.close();
    //qDebug() << cpuInfo;
}
