#include "diacalendario.h"

DiaCalendario::DiaCalendario(QWidget *parent)
    : QWidget{parent}
{
    recuadro.setFrameStyle(QFrame::Box);

    recuadro.setParent(this);
    fecha.setParent(&recuadro);
    indicadorEventos.setParent(&recuadro);

    indicadorEventos.setStyleSheet("QLabel { background: blue; }");
}

void DiaCalendario::setFecha(int f)
{
    fecha.setNum(f);
}

int DiaCalendario::getFecha()
{
    return fecha.text().toInt();
}

void DiaCalendario::resize(int w, int h)
{
    QWidget::resize(w, h);

    recuadro.resize((int) (w * 0.9), (int) (h * 0.9));
    recuadro.move((int) (w * 0.05), (int) (h * 0.05));

    fecha.move((int) (w * 0.05), (int) (h * 0.05));

    indicadorEventos.resize((int) (w * 0.05), (int) (h * 0.05));
    indicadorEventos.move((int) (w * 0.8), (int) (h * 0.05));

    setMouseTracking(true);
}

void DiaCalendario::mouseReleaseEvent(QMouseEvent *e)
{
    emit diaClickeado( fecha.text().toInt() );
}

void DiaCalendario::mouseMoveEvent(QMouseEvent *e)
{
    emit diaHovered(eventos, fecha.text().toInt());
}

void DiaCalendario::agregarEvento(QString nuevoEvento)
{
    eventos.append(nuevoEvento);

    indicadorEventos.setStyleSheet("QLabel { background: red; }");
}

int DiaCalendario::cantEventosDia()
{
    return eventos.size();
}

QString DiaCalendario::getEvento(int indice)
{
    return eventos[indice];
}
