#ifndef ECGRECEIVER_H
#define ECGRECEIVER_H

#include <QObject>
#include <QtSerialPort/QSerialPort>

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
    void dataReceived(float *data);

protected:
    QSerialPort port;
    float *buffer;

protected slots:
    void readData();

public slots:
    void start(const QString &portName, QSerialPort::BaudRate baudRate);
    void stop();

};

#endif // ECGRECEIVER_H
