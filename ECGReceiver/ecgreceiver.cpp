#include "ecgreceiver.h"
#include "qdebug.h"

ECGReceiver::ECGReceiver(QObject *parent)
    : QObject{parent}
{
    connect(&port, SIGNAL(readyRead()), this, SLOT(readData()));
}

ECGReceiver::~ECGReceiver()
{
    if (buffer) {
        stop();
        qDebug() << "stopping";
    }
}

void ECGReceiver::readData()
{
    int dataIndex = 0;
    float readData;

    while(port.bytesAvailable()) {
        port.read((char*) &readData, sizeof(readData));

        buffer[dataIndex] = readData;
        dataIndex++;
    }
qDebug() << buffer[0];
    emit dataReceived(buffer);
}

void ECGReceiver::start(const QString &portName, QSerialPort::BaudRate baudRate)
{
    port.setBaudRate(baudRate);
    port.setStopBits(QSerialPort::TwoStop);
    port.setParity(QSerialPort::NoParity);
    port.setPortName(portName);
    port.open(QIODevice::ReadOnly);

    if (port.isOpen()) {
        buffer = (float*) malloc(BUFFER_SIZE * sizeof(float));

        emit started();
    }
    else {
        emit portError();
    }
}

void ECGReceiver::stop()
{
    free(buffer);

    buffer = NULL;
}
