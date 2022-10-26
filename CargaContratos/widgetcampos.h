#ifndef WIDGETCAMPOS_H
#define WIDGETCAMPOS_H

#include <QWidget>
#include <QVBoxLayout>

#include "campo.h"

class WidgetCampos : public QWidget
{
    Q_OBJECT
public:
    explicit WidgetCampos(QWidget *parent = nullptr);
    ~WidgetCampos();

    void agregarCampo(QString label);
    int cantCampos();
    QString labelAt(int i);
    QString textAt(int i);
    int encontrar(QString label);

private:
    QVector<Campo*> campos;

    QVBoxLayout *layout;

signals:

};

#endif // WIDGETCAMPOS_H
