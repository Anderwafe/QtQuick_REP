#include "dmesg.h"
#include <QIODevice>
#include <QFile>
#include <QTextStream>
#include <QProcess>

QString DmesgInfo::GetDmesgInfo()
{
    return dmesgInfo;
}

void DmesgInfo::SetDmesgInfo(QString value)
{
    dmesgInfo = value;
}

DmesgInfo::DmesgInfo()
{
    QProcess proc;
    proc.startCommand("dmesg");
    proc.waitForFinished();
    dmesgInfo = proc.readAllStandardOutput();
    dmesgInfo += proc.readAllStandardError();
}
