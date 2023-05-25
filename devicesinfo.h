#ifndef DEVICESINFO_H
#define DEVICESINFO_H

#include <QObject>

class DevicesInfo : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString GetDevicesInfo READ GetDevicesInfo WRITE SetDevicesInfo NOTIFY DevicesInfoChanged)
public:
    QString devicesInfo;

    DevicesInfo();

    void SetDevicesInfo(QString value);

    QString GetDevicesInfo();

signals:
    void DevicesInfoChanged();
};

#endif // DEVICESINFO_H
