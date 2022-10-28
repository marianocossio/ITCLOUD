#include "systeminfolinux.h"

SystemInfoLinux::SystemInfoLinux() :
    SystemInfo()
{

}

void SystemInfoLinux::init()
{
    cargaCpuUltimo = obtenerDatosCpu();
}

double SystemInfoLinux::cpuLoad()
{
    QVector<qulonglong> datosViejos = cargaCpuUltimo;
    QVector<qulonglong> datosNuevos = obtenerDatosCpu();
    cargaCpuUltimo = datosNuevos;

    qulonglong userActual = datosNuevos[0] - datosViejos[0];
    qulonglong userNiceActual = datosNuevos[1] - datosViejos[1];
    qulonglong systemlActual = datosNuevos[2] - datosViejos[2];
    qulonglong idleActual = datosNuevos[3] - datosViejos[3];

    qulonglong totalUsado = userActual + userNiceActual + systemlActual;

    qulonglong total = totalUsado + idleActual;

    double porcentaje = (double) totalUsado / (double) total * 100.0;

    return qBound(0.0, porcentaje, 100.0);
}

double SystemInfoLinux::memoryUsed()
{

}

QVector<qulonglong> SystemInfoLinux::obtenerDatosCpu()
{
    QFile file("/proc/stat");
    file.open(QIODevice::ReadOnly);

    QByteArray primeraLinea = file.readLine();
    file.close();

    qulonglong user, userNice, system, idle;

    QTextStream texto(primeraLinea);
    QString primeraPalabra;

    texto >> primeraPalabra;
    texto >> user;
    texto >> userNice;
    texto >> system;
    texto >> idle;

    QVector<qulonglong> datosDevueltos;

    datosDevueltos.append(user);
    datosDevueltos.append(userNice);
    datosDevueltos.append(system);
    datosDevueltos.append(idle);

    return datosDevueltos;
}
