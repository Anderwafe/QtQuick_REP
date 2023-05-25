#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "indicatorswitcher.h"
#include <QQmlProperty>
#include <QString>
#include <QFile>
#include <QQmlComponent>
#include <processorinfo.h>
#include <devicesinfo.h>
#include <raminfo.h>
#include <dmesg.h>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    qmlRegisterType<ProcessorInfo>("com.release8.ProcessorInfo", 1, 0, "ProcessorInfo");
    qmlRegisterType<DevicesInfo>("com.release8.DevicesInfo", 1, 0, "DevicesInfo");
    qmlRegisterType<RAMInfo>("com.release8.RAMInfo", 1, 0, "RAMInfo");
    qmlRegisterType<IndicatorSwitcher>("com.lab3.switcher", 1, 0, "IndicatorSwitcher");
    qmlRegisterType<DmesgInfo>("com.release8.DmesgInfo", 1, 0, "DmesgInfo");

    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    //    Controller controller;

    //    engine.rootContext()->setContextProperty("newCont", &controller);
    engine.load(url);

    return app.exec();
}
