#include "mainwindow.h"
#include "ui_mainwindow.h"

#define DIMENSION_DIAS 100
#define PADDING 10

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    connect(&dialogo, SIGNAL( accepted() ), this, SLOT( agregarEventoADia() ));

    QDate inicioDeMes(
                QDate::currentDate().year(),
                QDate::currentDate().month(),
                1
                );

    QDate finalDeMes(
                QDate::currentDate().year(),
                QDate::currentDate().month(),
                QDate::currentDate().daysInMonth()
                );

    inicioDeMes = inicioDeMes.addDays( -(inicioDeMes.dayOfWeek() - 1) );
    finalDeMes = finalDeMes.addDays( 7 - finalDeMes.dayOfWeek() );

    QVector<QString> dias;

    dias.append("Lunes");
    dias.append("Martes");
    dias.append("Miercoles");
    dias.append("Jueves");
    dias.append("Viernes");
    dias.append("Sabado");
    dias.append("Domingo");

    ui->widgetCalendario->resize(7 * DIMENSION_DIAS,
                                 ((inicioDeMes.daysTo(finalDeMes) + 1) / 7) * DIMENSION_DIAS);

    ui->widgetCalendario->move(PADDING, PADDING);

    resize(ui->widgetCalendario->width() + 2 * PADDING + 150,
           ui->widgetCalendario->height() + ui->statusbar->height() + 2 * PADDING);

    setMinimumSize(ui->widgetCalendario->width() + 2 * PADDING + 150,
                   ui->widgetCalendario->height() + ui->statusbar->height() + 2 * PADDING);

    setMaximumSize(ui->widgetCalendario->width() + 2 * PADDING + 150,
                   ui->widgetCalendario->height() + ui->statusbar->height() + 2 * PADDING);

    setWindowTitle("Calendario");

    ui->eventosLabel->move(ui->widgetCalendario->width() + PADDING, 20);

    for (int dia = 0; dia < (inicioDeMes.daysTo(finalDeMes) + 1); dia++) {
        fechas.append( new DiaCalendario(ui->widgetCalendario) );

        connect(fechas[dia],
                SIGNAL( diaClickeado(int) ),
                this,
                SLOT( diaSeleccionado(int) ));

        connect(fechas[dia],
                SIGNAL( diaHovered(QVector<QString>, int) ),
                this,
                SLOT( actualizarLabelEventos(QVector<QString>, int) ));

        fechas[dia]->resize(100,100);
        fechas[dia]->setFecha(inicioDeMes.addDays(dia).day());
        fechas[dia]->move((dia % 7) * DIMENSION_DIAS, (dia / 7) * DIMENSION_DIAS);
    }
}

MainWindow::~MainWindow()
{
    /*for (int dia = 0; dia < representacionGraficaDias.size(); dia++) {
        delete representacionGraficaDias[dia];
        delete numerosDias[dia];
    }*/

    delete ui;
}

void MainWindow::diaSeleccionado(int fechaDiaSeleccionado)
{
    for (int i = 0; i < fechas.size(); i++) {
        if (fechas[i]->getFecha() == fechaDiaSeleccionado) {
            indiceDiaSeleccionado = i;

            i = fechas.size();
        }
    }

    dialogo.show();
}

void MainWindow::actualizarLabelEventos(const QVector<QString> &evs, int fecha)
{
    QString texto = QString::number(fecha);

    if (evs.size() > 0) {
        for (int i = 0; i < evs.size(); i++) {
            texto.append("\n" + evs[i]);
        }
    }
    else {
        texto.append("\nSin eventos.");
    }

    ui->eventosLabel->setText(texto);
    ui->eventosLabel->adjustSize();
}

void MainWindow::agregarEventoADia()
{
    fechas[indiceDiaSeleccionado]->agregarEvento(dialogo.getEvento());

    QTextStream salida(&manejadorArchivos);

    manejadorArchivos.setFileName("calendario.txt");
    manejadorArchivos.open(QIODevice::WriteOnly | QIODevice::Text);

    for (int dia = 0; dia < fechas.size(); dia++) {
        salida << QByteArray::number( fechas[dia]->getFecha() ) + "\n" ;

        for (int i = 0; i < fechas[dia]->cantEventosDia(); i++) {
            salida << fechas[dia]->getEvento(i).toLatin1() + "\n" ;
        }
    }

    manejadorArchivos.close();
}

