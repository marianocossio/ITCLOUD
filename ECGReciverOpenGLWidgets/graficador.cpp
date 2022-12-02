#include "graficador.h"

Graficador::Graficador(QWidget *parent) : QOpenGLWidget(parent)
{
    background = QColor("#C6D5F8");
    signalColor = QColor("#031D58");

    graphicZoom = 200;
}

void Graficador::addData(float newData)
{
    signal.append(newData);

    while (signal.size() > width())
    {
        signal.removeFirst();
    }

    update();
}

void Graficador::initializeGL()
{
    initializeOpenGLFunctions();

    glClearColor(background.redF(), background.greenF(), background.blueF(), background.alphaF());
}

void Graficador::resizeGL(int w, int h)
{
    glViewport(0, 0, w, h);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();

    glOrtho(0.0f, w * 1.0f, 0.0f, h * 1.0f, -1.0f, 1.0f);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
}

void Graficador::paintGL()
{
    glClear(GL_COLOR_BUFFER_BIT);

    /*glPushMatrix();
    glScalef(1.0, 1.0, 1.0);

    glBegin(GL_TRIANGLES);

    glColor3f(1.0f, 0.0f, 0.0f);
    glVertex3f(0.0, 0.0, 0.0);

    glColor3f(0.0f, 1.0f, 0.0f);
    glVertex3f(100.0, 200.0, 0.0);

    glColor3f(0.0f, 0.0f, 1.0f);
    glVertex3f(300.0, 0.0, 0.0);

    glEnd();
    glPopMatrix();*/

    glPushMatrix();

    glScalef(1.0, graphicZoom * 1.0, 1.0);

    glLineWidth(2.0f);
    glBegin(GL_LINES);

    glColor3f(signalColor.redF(), signalColor.greenF(), signalColor.blueF());

    /*for (int i = 0; i < 300; i+=10)
    {
        glVertex3f(i * 1.0f, i * 1.0f, 0.0f);
        glVertex3f((i + 10) * 1.0f, (i + 10) * 1.0f, 0.0f);
    }*/

    for (int i = 0; i < (signal.size() - 1); i++)
    {
        glVertex3f(i * 1.0f, signal[i], 0.0f);
        glVertex3f((i + 1) * 1.0f, signal[i + 1], 0.0f);
    }

    glEnd();

    glPopMatrix();

    glFlush();
}

void Graficador::wheelEvent(QWheelEvent *event)
{
    if (!event->angleDelta().isNull())
    {
        if (event->angleDelta().y() > 0)
        {
            // Incrementar Zoom
            graphicZoom += 10;
        }
        else
        {
            // Decrementar Zoom
            graphicZoom -= 10;

            if (graphicZoom < 1) {
                graphicZoom = 1;
            }
        }

        update();
    }
}
