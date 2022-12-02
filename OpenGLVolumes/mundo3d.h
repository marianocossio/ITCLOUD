#ifndef MUNDO3D_H
#define MUNDO3D_H

#include <QOpenGLWidget>
#include <QOpenGLFunctions_1_1>
#include <QObject>
#include <QMouseEvent>
#include <QWheelEvent>

class Mundo3D : public QOpenGLWidget , protected QOpenGLFunctions_1_1
{
    Q_OBJECT
public:
    Mundo3D(QWidget *parent = 0);

private:
    QColor color;
    float graphicZoom;
    float yRotation;
    float xRotation;
    float yTranslation;
    float xTranslation;
    int dragXCoord;
    int dragYCoord;
    bool draggingRotation;
    bool draggingTranslation;

    // QOpenGLWidget interface
protected:
    void initializeGL() override;
    void resizeGL(int w, int h) override;
    void paintGL() override;

    // QWidget interface
protected:
    void mousePressEvent(QMouseEvent *event) override;
    void mouseReleaseEvent(QMouseEvent *event) override;
    void mouseMoveEvent(QMouseEvent *event) override;
    void wheelEvent(QWheelEvent *event) override;
};

#endif // MUNDO3D_H
