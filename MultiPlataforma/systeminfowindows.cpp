#include "systeminfowindows.h"

SystemInfoWindows::SystemInfoWindows() :
    SystemInfo()
{

}

void SystemInfoWindows::init()
{
    cargaCpuUltimo = obtenerDatosCpu();
}

double SystemInfoWindows::cpuLoad()
{
    QVector<qulonglong> datosViejos = cargaCpuUltimo;
    QVector<qulonglong> datosNuevos = obtenerDatosCpu();
    cargaCpuUltimo = datosNuevos;

    qulonglong idleActual = datosNuevos[0] - datosViejos[0];
    qulonglong kernelActual = datosNuevos[1] - datosViejos[1];
    qulonglong userActual = datosNuevos[2] - datosViejos[2];

    qulonglong sistema = kernelActual + userActual;

    double porcentaje = (sistema - idleActual) * 100.0 / sistema;

    return qBound(0.0, porcentaje, 100.0);
}

double SystemInfoWindows::memoryUsed()
{
    MEMORYSTATUSEX estadoMemoria;

    estadoMemoria.dwLength = sizeof(MEMORYSTATUSEX);

    GlobalMemoryStatusEx(&estadoMemoria);

    qulonglong memoriaUtilizada = estadoMemoria.ullTotalPhys - estadoMemoria.ullAvailPhys;

    return (double) memoriaUtilizada / (double) estadoMemoria.ullTotalPhys * 100.0;
}

QVector<qulonglong> SystemInfoWindows::obtenerDatosCpu()
{
    FILETIME idle, kernel, user;

    GetSystemTimes(&idle, &kernel, &user);

    QVector<qulonglong> datoDevuelto;

    datoDevuelto.append(convertirFileTime(idle));
    datoDevuelto.append(convertirFileTime(kernel));
    datoDevuelto.append(convertirFileTime(user));

    return datoDevuelto;
}

qulonglong SystemInfoWindows::convertirFileTime(const FILETIME &filetime) const
{
    ULARGE_INTEGER largeInteger;

    largeInteger.LowPart = filetime.dwLowDateTime;
    largeInteger.HighPart = filetime.dwHighDateTime;

    return largeInteger.QuadPart;
}
