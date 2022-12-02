#ifndef GRAFICADOR_H
#define GRAFICADOR_H

#include <QOpenGLWidget>
#include <QObject>

#include <QOpenGLFunctions_1_1>
#include <QWheelEvent>
#include <QEvent>

class Graficador : public QOpenGLWidget, protected QOpenGLFunctions_1_1
{
    Q_OBJECT
public:
    Graficador(QWidget *parent = 0);

    void addData(float newData);

    // QOpenGLWidget interface
protected:
    void initializeGL() override;
    void resizeGL(int w, int h) override;
    void paintGL() override;

private:
    QColor signalColor;
    QColor background;

    QVector<float> signal;

    int graphicZoom;

    // QWidget interface
protected:
    void wheelEvent(QWheelEvent *event) override;
};

#endif // GRAFICADOR_H
