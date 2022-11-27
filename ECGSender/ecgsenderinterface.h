#ifndef ECGSENDERINTERFACE_H
#define ECGSENDERINTERFACE_H

#include "ecgsender.h"
#include <QObject>

class ECGSenderInterface : public ECGSender
{
    Q_OBJECT
public:
    explicit ECGSenderInterface(QObject *parent = nullptr);

public slots:
    Q_INVOKABLE void start(const QString &signalFile, const QString &portName, float freq, QSerialPort::BaudRate baudRate);
    Q_INVOKABLE void stop();
};

#endif // ECGSENDERINTERFACE_H
