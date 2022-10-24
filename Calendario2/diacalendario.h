#ifndef DIACALENDARIO_H
#define DIACALENDARIO_H

#include <QWidget>
#include <QFrame>
#include <QLabel>
#include <QMouseEvent>

class DiaCalendario : public QWidget
{
    Q_OBJECT
private:
    QFrame recuadro;
    QLabel fecha;
    QLabel indicadorEventos;

    QVector<QString> eventos;

public:
    explicit DiaCalendario(QWidget *parent = nullptr);
    void setFecha(int f);
    int getFecha();

    void resize(int w, int h);
    void mouseReleaseEvent(QMouseEvent *e);
    void mouseMoveEvent(QMouseEvent *e);
    void agregarEvento(QString nuevoEvento);

    int cantEventosDia();
    QString getEvento(int indice);

signals:
    void diaClickeado(int f);
    void diaHovered(const QVector<QString> &evs, int fecha);

};

#endif // DIACALENDARIO_H
