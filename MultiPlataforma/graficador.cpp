#include "graficador.h"

Graficador::Graficador(QWidget *parent)
    : QWidget{parent}
{
    zoom = 1;
}

void Graficador::nuevoDato(double nD)
{
    datos.append(nD);

    if (datos.size() > (width() / 10)) {
        datos.removeFirst();
    }

    update();
}

void Graficador::paintEvent(QPaintEvent *event)
{
    QPainter painter(this);

    painter.setPen(Qt::black);
    painter.setPen(Qt::RoundJoin);

    for (int i = 0; i < (datos.size() - 1); i++) {
        painter.drawLine(i * 10, height() - (datos[i] * zoom), (i + 1) * 10, height() - (datos[i + 1] * zoom));
    }

    painter.drawLine(0, 0, 0, height());

    painter.drawLine(0, height(), width(), height());
}

void Graficador::actualizarZoom(int nuevoZoom)
{
    zoom = nuevoZoom;

    update();
}
