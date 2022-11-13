#ifndef FILEHANDLER_H
#define FILEHANDLER_H

#include <QObject>
#include <QFile>
#include <QTextStream>

class FileHandler : public QObject
{
    Q_OBJECT

    Q_PROPERTY(qreal cantMuestras READ getCantMuestras WRITE setCantMuestras NOTIFY cantMuestrasChanged);

public:
    explicit FileHandler(QObject *parent = nullptr);

    Q_INVOKABLE void openFile(const QString &fileName);
    Q_INVOKABLE void closeFile();
    Q_INVOKABLE float read();
    Q_INVOKABLE bool isOpen();

    float getCantMuestras();
    void setCantMuestras(qreal muestras);

signals:
    void cantMuestrasChanged(qreal muestras);

private:
    QFile handler;
    QTextStream stream;

    QList<float> data;

    int index;

    float cantMuestras;

signals:

};

#endif // FILEHANDLER_H
