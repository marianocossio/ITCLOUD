#include "ecgreceiver.h"
#include "qdebug.h"

ECGReceiver::ECGReceiver(QObject *parent)
    : QObject{parent}
{
    connect(&port, SIGNAL(errorOccurred(QSerialPort::SerialPortError)), this, SLOT(informError(QSerialPort::SerialPortError)));
    connect(&port, SIGNAL(readyRead()), this, SLOT(readData()));
}

ECGReceiver::~ECGReceiver()
{
    /*if (buffer) {
        stop();
        qDebug() << "stopping";
    }*/
}

void ECGReceiver::readData()
{
    // int dataIndex = 0;
    float data;

    buffer.clear();

    while(port.bytesAvailable() >= sizeof(data)) {
        port.read((char*) &data, sizeof(data));

        buffer.append(QVariant(data));

        // No se utiliza mas el buffer como vector. Ahora es una QVariantList.
        // buffer[dataIndex] = data;
        // dataIndex++;

        //qDebug() << data;
    }

    emit dataReceived(buffer);
}

void ECGReceiver::informError(QSerialPort::SerialPortError error)
{
    qDebug() << error;
}

void ECGReceiver::start(const QString &portName, QSerialPort::BaudRate baudRate)
{
    port.setBaudRate(baudRate);
    port.setStopBits(QSerialPort::TwoStop);
    port.setParity(QSerialPort::NoParity);
    port.setPortName(portName);
    port.open(QIODevice::ReadOnly);

    if (port.isOpen()) {
        // La conversión entre float* (C++) y var (JavaScript) no es directa, así que tuvimos que cambiar el tipo de datos del buffer.
        // Ahora buffer es una lista de QVariant, (QList<QVariant> o QVariantList), que es un tipo de datos que el QMLEngine
        // sabe convertir a los tipos de datos manejados desde QML (var, real, int, etc.).
        // buffer = (float*) malloc(BUFFER_SIZE * sizeof(float));

        emit started();
    }
    else {
        emit portError();
    }
}

void ECGReceiver::stop()
{
    /*free(buffer);

    buffer = NULL;*/
}
