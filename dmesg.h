#ifndef DMESG_H
#define DMESG_H

#include <QObject>

class DmesgInfo : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString GetDmesgInfo READ GetDmesgInfo WRITE SetDmesgInfo NOTIFY DmesgInfoChanged)
public:
    QString dmesgInfo;

    DmesgInfo();

    void SetDmesgInfo(QString value);

    QString GetDmesgInfo();

signals:
    void DmesgInfoChanged();
};

#endif // DMESG_H
