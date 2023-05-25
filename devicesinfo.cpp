#include "devicesinfo.h"
#include <QIODevice>
#include <QFile>
#include <QTextStream>

QString DevicesInfo::GetDevicesInfo()
{
    return devicesInfo;
}

void DevicesInfo::SetDevicesInfo(QString value)
{
    devicesInfo = value;
}

DevicesInfo::DevicesInfo()
{
    QFile file("/proc/devices");
    file.open(QIODevice::Text | QIODevice::ReadOnly);
    QTextStream in(&file);
    QString line = in.readLine();
    devicesInfo += line;
    line = in.readLine();
    while(!line.isNull())
    {
        devicesInfo += "\n";
        devicesInfo += line;
        line = in.readLine();
    }
    file.close();
    //qDebug() << cpuInfo;
}
