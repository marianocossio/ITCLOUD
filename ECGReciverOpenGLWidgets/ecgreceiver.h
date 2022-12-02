#ifndef ECGRECEIVER_H
#define ECGRECEIVER_H

#include <QObject>
#include <QtSerialPort/QSerialPort>
#include <QVariant>

#define BUFFER_SIZE 100

class ECGReceiver : public QObject
{
    Q_OBJECT
public:
    explicit ECGReceiver(QObject *parent = nullptr);
    ~ECGReceiver();

signals:
    void started();
    void stopped();
    void portError();
    void dataReceived(const QVariantList &data);

protected:
    QSerialPort port;
    QVariantList buffer;

protected slots:
    void readData();
    void informError(QSerialPort::SerialPortError error);

public slots:
    void start(const QString &portName, QSerialPort::BaudRate baudRate);
    void stop();

};

#endif // ECGRECEIVER_H
