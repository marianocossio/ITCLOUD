#ifndef CLASEPRUEBA_H
#define CLASEPRUEBA_H

#include <QObject>

class ClasePrueba : public QObject
{
    Q_OBJECT
public:
    explicit ClasePrueba(QObject *parent = nullptr);

    Q_INVOKABLE void imprimirStringPorConsola(const QString &str) const;

signals:

};

#endif // CLASEPRUEBA_H
