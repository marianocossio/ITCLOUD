#include "claseprueba.h"
#include "qdebug.h"

ClasePrueba::ClasePrueba(QObject *parent)
    : QObject{parent}
{

}

void ClasePrueba::imprimirStringPorConsola(const QString &str) const
{
    qDebug() << str;
}
