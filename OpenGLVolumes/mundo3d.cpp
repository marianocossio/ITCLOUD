#include "mundo3d.h"

Mundo3D::Mundo3D(QWidget *parent) : QOpenGLWidget(parent)
{
    color = QColor("#292E3A");
    graphicZoom = 1.0f;

    yRotation = 0.0f;
    xRotation = 0.0f;

    yTranslation = 0.0f;
    xTranslation = 1.5f;

    draggingRotation = false;
    draggingTranslation = false;
}

void Mundo3D::initializeGL()
{
    initializeOpenGLFunctions();

    glClearColor(color.redF(), color.greenF(), color.blueF(), color.alphaF());

    // Habilitamos la comprobación de profundidad, para que grafique solamente lo que está adelante espacialmente.
    // Los píxeles que queden tapados por otros píxeles no se ven.
    glEnable(GL_DEPTH_TEST);
}

void Mundo3D::resizeGL(int w, int h)
{
    glViewport(0, 0, w, h);

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(0.0f, 3.0f, -1.0f, 2.0f, -10.0f, 10.0f);

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
}

void Mundo3D::paintGL()
{
    // Tenemos que borrar los colores que quedaron de la graficación anterior (GL_COLOR_BUFFER_BIT),
    // así como la información sobre la profundidad de los píxeles (GL_DEPTH_BUFFER_BIT).
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    //glClear(GL_COLOR_BUFFER_BIT);

    glPushMatrix();

    glTranslatef(xTranslation, yTranslation, 1.5f);

    glRotatef(yRotation, 0.0f, 1.0f, 0.0f);
    glRotatef(xRotation, 1.0f, 0.0f, 0.0f);

    glScalef(graphicZoom, graphicZoom, graphicZoom);

    glLineWidth(1.5);

    // ----------------------------------- CARAS DE LA PIRÁMIDE
    glBegin(GL_TRIANGLES);
       // Izquierda
       glColor3f(1.0f, 0.0f, 0.0f);
       glVertex3f( -0.5f, 0.0f, -0.5f);
       glColor3f(1.0f, 1.0f, 1.0f);
       glVertex3f( -0.5f, 0.0f, 0.5f);
       glColor3f(0.0f, 0.0f, 1.0f);
       glVertex3f( 0.0f, 1.0f, 0.0f);

       // Atras
       glColor3f(1.0f, 0.0f, 0.0f);
       glVertex3f( -0.5f, 0.0f, -0.5f);
       glColor3f(1.0f, 1.0f, 1.0f);
       glVertex3f( 0.5f, 0.0f, -0.5f);
       glColor3f(0.0f, 0.0f, 1.0f);
       glVertex3f( 0.0f, 1.0f, 0.0f);

       // Derecha
       glColor3f(1.0f, 1.0f, 1.0f);
       glVertex3f( 0.5f, 0.0f, -0.5f);
       glColor3f(0.0f, 1.0f, 0.0f);
       glVertex3f( 0.5f, 0.0f, 0.5f);
       glColor3f(0.0f, 0.0f, 1.0f);
       glVertex3f( 0.0f, 1.0f, 0.0f);

       // Frente
       glColor3f(1.0f, 1.0f, 1.0f);
       glVertex3f( -0.5f, 0.0f, 0.5f);
       glColor3f(0.0f, 1.0f, 0.0f);
       glVertex3f( 0.5f, 0.0f, 0.5f);
       glColor3f(0.0f, 0.0f, 1.0f);
       glVertex3f( 0.0f, 1.0f, 0.0f);
   glEnd();

   // ----------------------------------- BASE DE LA PIRÁMIDE
   glBegin(GL_QUADS);
      // Abajo
       glColor3f(1.0f, 0.0f, 0.0f);
       glVertex3f( -0.5f, 0.0f, -0.5f);
       glColor3f(0.0f, 1.0f, 0.0f);
       glVertex3f( 0.5f, 0.0f, -0.5f);
       glColor3f(0.0f, 0.0f, 1.0f);
       glVertex3f( 0.5f, 0.0f, 0.5f);
       glColor3f(1.0f, 1.0f, 1.0f);
       glVertex3f( -0.5f, 0.0f, 0.5f);
   glEnd();

   // ----------------------------------- ARISTAS DE LA PIRÁMIDE
   glBegin(GL_LINES);
       // Izquierda
       glColor3f(0.23f, 0.16f, 0.2f);
       glVertex3f( -0.5f, 0.0f, -0.5f);
       glVertex3f( -0.5f, 0.0f, 0.5f);
       glVertex3f( -0.5f, 0.0f, -0.5f);
       glVertex3f( 0.0f, 1.0f, 0.0f);
       glVertex3f( -0.5f, 0.0f, 0.5f);
       glVertex3f( 0.0f, 1.0f, 0.0f);

       // Atras
       glColor3f(0.23f, 0.16f, 0.2f);
       glVertex3f( -0.5f, 0.0f, -0.5f);
       glVertex3f( 0.5f, 0.0f, -0.5f);
       glVertex3f( -0.5f, 0.0f, -0.5f);
       glVertex3f( 0.0f, 1.0f, 0.0f);
       glVertex3f( 0.5f, 0.0f, -0.5f);
       glVertex3f( 0.0f, 1.0f, 0.0f);

       // Derecha
       glColor3f(0.23f, 0.16f, 0.2f);
       glVertex3f( 0.5f, 0.0f, -0.5f);
       glVertex3f( 0.5f, 0.0f, 0.5f);
       glVertex3f( 0.5f, 0.0f, -0.5f);
       glVertex3f( 0.0f, 1.0f, 0.0f);
       glVertex3f( 0.5f, 0.0f, 0.5f);
       glVertex3f( 0.0f, 1.0f, 0.0f);

       // Frente
       glColor3f(0.23f, 0.16f, 0.2f);
       glVertex3f( -0.5f, 0.0f, 0.5f);
       glVertex3f( 0.5f, 0.0f, 0.5f);
       glVertex3f( -0.5f, 0.0f, 0.5f);
       glVertex3f( 0.0f, 1.0f, 0.0f);
       glVertex3f( 0.5f, 0.0f, 0.5f);
       glVertex3f( 0.0f, 1.0f, 0.0f);
   glEnd();

   glPopMatrix();
}

void Mundo3D::mousePressEvent(QMouseEvent *event)
{
    if (event)
    {
        dragXCoord = event->position().x();
        dragYCoord = event->position().y();

        if (event->button() == Qt::LeftButton)
        {
            draggingRotation = true;
        }
        else if (event->button() == Qt::MiddleButton)
        {
            draggingTranslation = true;
        }
    }
}

void Mundo3D::mouseReleaseEvent(QMouseEvent *event)
{
    draggingRotation = false;
    draggingTranslation = false;
}

void Mundo3D::mouseMoveEvent(QMouseEvent *event)
{
    if (event)
    {
        if (draggingRotation)
        {
            if (dragXCoord > event->position().x())
            {
                yRotation -= 0.5f;
            }
            else if (dragXCoord < event->position().x())
            {
                yRotation += 0.5f;
            }

            if (dragYCoord > event->position().y())
            {
                xRotation -= 0.5f;
            }
            else if (dragYCoord < event->position().y())
            {
                xRotation += 0.5f;
            }
        }

        if (draggingTranslation)
        {
            /*if (dragXCoord > event->position().x())
            {
                xTranslation -= 0.01f;
            }
            else if (dragXCoord < event->position().x())
            {
                xTranslation += 0.01f;
            }

            if (dragYCoord > event->position().y())
            {
                yTranslation += 0.01f;
            }
            else if (dragYCoord < event->position().y())
            {
                yTranslation -= 0.01f;
            }*/

            xTranslation += (event->position().x() - dragXCoord) / (width() * 1.0f);
            yTranslation -= (event->position().y() - dragYCoord) / (height() * 1.0f);
        }

        dragXCoord = event->position().x();
        dragYCoord = event->position().y();

        update();
    }
}

void Mundo3D::wheelEvent(QWheelEvent *event)
{
    if (event)
    {
        if(event->angleDelta().y() > 0)
        {
            graphicZoom += 0.1f;
        }
        else if(event->angleDelta().y() < 0)
        {
            graphicZoom -= 0.1f;

            if (graphicZoom < 0.1)
            {
                graphicZoom = 0.1;
            }
        }

        update();
    }
}
