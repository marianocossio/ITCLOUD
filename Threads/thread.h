#ifndef THREAD_H
#define THREAD_H

#include <QMutex>
#include <QMutexLocker>
#include <QThread>
#include <QObject>
#include <QDebug>


class Thread : public QThread
{
    Q_OBJECT
public:
    Thread();

    void parar();

    void setText(const QString &str);


    // QThread interface
protected:
    virtual void run() override;

private:
    volatile bool corriendo;
    QString texto;
    QMutex mutex;

signals:
    void modificarLabel(const QString &str);
};

#endif // THREAD_H
