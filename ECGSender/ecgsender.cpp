#include "ecgsender.h"

ECGSender::ECGSender(QObject *parent)
    : QObject{parent}
{
    connect(&timer, SIGNAL(timeout()), this, SLOT(sendData()));
}

void ECGSender::sendData()
{
    // Corroboramos que el archivo esté abierto.
    if (file.isOpen()) {
        // Y que no hayamos terminado de leerlo.
        if (!text.atEnd()){
            // Leemos un dato del archivo.
            text >> lastData;

            // Corroboramos que el puerto esté abierto.
            if (port.isOpen()) {
                // Escribimos el dato en binario.
                port.write((char*) &lastData, sizeof(lastData));
                // Para escribirlo como archivo de texto:
                // port.write(QByteArray::number(lastData));
            }
            // Si el puerto no está abierto es porque algo falló. Cerramos todo, y emitimos una señal de error.
            else {
                stop();
                emit portError();
            }
        }
        // Si no hay más datos por leer cerramos todo. No emitimos señal en este caso, porque no hay error.
        else {
            stop();
        }
    }

    // Si el archivo no se puedo abrir, y estoy intentando abrirlo, es porque algo falló. Cerramos todo y
    // emitimos una señal de error.
    else {
        stop();
        emit fileError();
    }
}

void ECGSender::start(const QString &signalFile, const QString &portName, float freq, QSerialPort::BaudRate baudRate)
{
    file.setFileName(signalFile);

    text.setDevice(&file);

    file.open(QIODevice::ReadOnly | QIODevice::Text);

    if (file.isOpen()) {
        timer.start(1000.0 / freq);

        port.setBaudRate(baudRate);
        port.setStopBits(QSerialPort::TwoStop);
        port.setParity(QSerialPort::NoParity);
        port.setPortName(portName);
        port.open(QIODevice::WriteOnly);

        if (port.isOpen()) {
            emit started();
        }

        else {
            emit portError();
        }
    }

    else {
        emit fileError();
    }
}

void ECGSender::stop()
{
    timer.stop();

    file.close();

    port.close();

    emit stopped();
}
