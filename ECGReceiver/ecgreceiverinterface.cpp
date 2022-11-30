#include "ecgreceiverinterface.h"

ECGReceiverInterface::ECGReceiverInterface(QObject *parent)
    : ECGReceiver{parent}
{

}

void ECGReceiverInterface::start(const QString &portName, QSerialPort::BaudRate baudRate)
{
    ECGReceiver::start(portName, baudRate);
}

void ECGReceiverInterface::stop()
{
    ECGReceiver::stop();
}
