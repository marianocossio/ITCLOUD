#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "provisorimagenes.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.addImageProvider(QLatin1String("imageProvider"), new ProvisorImagenes);

    engine.load(url);

    return app.exec();
}
