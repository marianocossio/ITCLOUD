#ifndef SERIALCOMMUNICATOR_H
#define SERIALCOMMUNICATOR_H

#include <QObject>

#include <QtSerialPort/QSerialPortInfo>
#include <QtSerialPort/QSerialPort>

#include <QTimer>

class SerialCommunicator : public QObject
{
    Q_OBJECT
public:
    explicit SerialCommunicator(QObject *parent = nullptr);

    Q_INVOKABLE QStringList listAvailablePorts();

    Q_PROPERTY(QString portName READ getPortName WRITE setPortName NOTIFY portNameChanged);

private:
    QString portName;

    void setPortName(const QString &name);
    QString getPortName();

    QSerialPort port;

    QTimer timer;

signals:
    void portNameChanged(QString name);
    void valueReceived(char value);

public slots:
    Q_INVOKABLE void openPort();
    Q_INVOKABLE void closePort();
    Q_INVOKABLE void sendByte(char data);
    Q_INVOKABLE void sendString(const QString &data);

private slots:
    void readByte();

};

#endif // SERIALCOMMUNICATOR_H
