#ifndef RAMINFO_H
#define RAMINFO_H

#include <QObject>

class RAMInfo : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString GetRAMInfo READ GetRAMInfo WRITE SetRAMInfo NOTIFY RAMInfoChanged)
public:
    QString ramInfo;

    RAMInfo();

    void SetRAMInfo(QString value);

    QString GetRAMInfo();

signals:
    void RAMInfoChanged();
};

#endif // RAMINFO_H
