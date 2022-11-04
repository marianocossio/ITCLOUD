#include "thread.h"

Thread::Thread()
{
    corriendo = true;
}

void Thread::parar()
{
    QMutexLocker locker(&mutex);

    corriendo = false;
}

void Thread::setText(const QString &str)
{
    texto = str;
}

void Thread::run()
{
    while(true) {
        QMutexLocker locker(&mutex);

        if (!corriendo) {
            corriendo = true;
            break;
        }

        qDebug() << texto;

        emit(modificarLabel(texto));
    }
}
