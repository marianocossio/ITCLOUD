#ifndef ECGRECEIVERINTERFACE_H
#define ECGRECEIVERINTERFACE_H

#include "ecgreceiver.h"
#include <QObject>

class ECGReceiverInterface : public ECGReceiver
{
    Q_OBJECT
public:
    explicit ECGReceiverInterface(QObject *parent = nullptr);

public slots:
    Q_INVOKABLE void start(const QString &portName, QSerialPort::BaudRate baudRate);
    Q_INVOKABLE void stop();
};

#endif // ECGRECEIVERINTERFACE_H
