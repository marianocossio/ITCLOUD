#include "ecgsenderinterface.h"

ECGSenderInterface::ECGSenderInterface(QObject *parent)
    : ECGSender{parent}
{

}

void ECGSenderInterface::start(const QString &signalFile, const QString &portName, float freq, QSerialPort::BaudRate baudRate)
{
    ECGSender::start(signalFile, portName, freq, baudRate);
}

void ECGSenderInterface::stop()
{
    ECGSender::stop();
}
