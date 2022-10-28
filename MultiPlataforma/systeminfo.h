#ifndef SYSTEMINFO_H
#define SYSTEMINFO_H

#include <QtGlobal>

class SystemInfo
{
public:
    static SystemInfo& instancia();
    virtual ~SystemInfo();

    virtual void init() = 0;
    virtual double cpuLoad() = 0;
    virtual double memoryUsed() = 0;

protected:
    explicit SystemInfo();
};

#endif // SYSTEMINFO_H
