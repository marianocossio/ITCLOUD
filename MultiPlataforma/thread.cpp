#include "thread.h"

Thread::Thread()
{
    SystemInfo::instancia().init();

    connect(&timer, SIGNAL(timeout()), this, SLOT(enviarDato()));

    timer.start(100);
}

void Thread::enviarDato()
{
    emit actualizarCPU(SystemInfo::instancia().cpuLoad());
}
