#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    connect(&hilo, SIGNAL(actualizarCPU(double)), this, SLOT(actualizarLabel(double)));
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::actualizarLabel(double nuevoDato)
{
    ui->datosSistema->setText(QString::number(nuevoDato));
    ui->graficoWidget->nuevoDato(nuevoDato);
}


void MainWindow::on_dial_valueChanged(int value)
{
    ui->graficoWidget->actualizarZoom(value);
}

