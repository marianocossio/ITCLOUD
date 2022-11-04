#ifndef GRAFICADOR_H
#define GRAFICADOR_H

#include <QWidget>

#include <QPainter>
#include <QPen>
#include <QVector>

class Graficador : public QWidget
{
    Q_OBJECT
public:
    explicit Graficador(QWidget *parent = nullptr);

    void nuevoDato(double nD);

private:
    QVector<double> datos;
    int zoom;

signals:


    // QWidget interface
protected:
    virtual void paintEvent(QPaintEvent *event) override;

public slots:
    void actualizarZoom(int nuevoZoom);
};

#endif // GRAFICADOR_H
