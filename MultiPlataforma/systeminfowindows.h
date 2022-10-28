#ifndef SYSTEMINFOWINDOWS_H
#define SYSTEMINFOWINDOWS_H

#include "systeminfo.h"

#include <QtGlobal>
#include <QVector>
#include <windows.h>

class SystemInfoWindows : public SystemInfo
{
public:
    SystemInfoWindows();



    // SystemInfo interface
public:
    virtual void init() override;
    virtual double cpuLoad() override;
    virtual double memoryUsed() override;

private:
    QVector<qulonglong> cargaCpuUltimo;
    QVector<qulonglong> obtenerDatosCpu();

    qulonglong convertirFileTime(const FILETIME &filetime) const;
};

#endif // SYSTEMINFOWINDOWS_H
