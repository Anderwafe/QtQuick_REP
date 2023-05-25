#ifndef PROCESSORINFO_H
#define PROCESSORINFO_H

#include <QObject>

class ProcessorInfo : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString GetCpuInfo READ GetCpuInfo WRITE SetCpuInfo NOTIFY CpuInfoChanged)
public:
    QString cpuInfo;

    ProcessorInfo();

    void SetCpuInfo(QString value);

    QString GetCpuInfo();

signals:
    void CpuInfoChanged();
};

#endif // PROCESSORINFO_H
