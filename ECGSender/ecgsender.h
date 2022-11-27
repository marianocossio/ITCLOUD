#ifndef ECGSENDER_H
#define ECGSENDER_H

#include <QObject>
#include <QTimer>
#include <QFile>
#include <QTextStream>
#include <QtSerialPort/QSerialPort>

class ECGSender : public QObject
{
    Q_OBJECT
public:
    explicit ECGSender(QObject *parent = nullptr);

signals:

protected:
    QTimer timer;
    QFile file;
    QTextStream text;
    QSerialPort port;

    float lastData;

protected slots:
    void sendData();

public slots:
    void start(const QString &signalFile, const QString &portName, float freq, QSerialPort::BaudRate baudRate);
    void stop();

signals:
    void started();
    void stopped();
    void fileError();
    void portError();
};

#endif // ECGSENDER_H
