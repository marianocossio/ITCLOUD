#ifndef SYSTEMINFOLINUX_H
#define SYSTEMINFOLINUX_H

#include "systeminfo.h"

#include <QtGlobal>
#include <QVector>
#include <QFile>
#include <QTextStream>

#include <sys/types.h>
#include <sys/sysinfo.h>

class SystemInfoLinux : public SystemInfo
{
public:
    SystemInfoLinux();

    // SystemInfo interface
public:
    virtual void init() override;
    virtual double cpuLoad() override;
    virtual double memoryUsed() override;

private:
    QVector<qulonglong> cargaCpuUltimo;
    QVector<qulonglong> obtenerDatosCpu();

};

#endif // SYSTEMINFOLINUX_H
