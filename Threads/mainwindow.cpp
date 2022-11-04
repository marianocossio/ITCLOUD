#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    threadA.setText("Boton A presionado");
    threadB.setText("Boton B presionado");

    connect(&threadA, SIGNAL(modificarLabel(const QString)), this, SLOT(updateLabelA(const QString)));
    connect(&threadB, SIGNAL(modificarLabel(const QString)), this, SLOT(updateLabelB(const QString)));
}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_botonA_clicked()
{
    threadA.start();
}


void MainWindow::on_botonB_clicked()
{
    threadB.start();
}


void MainWindow::on_pushButton_clicked()
{
    threadA.parar();
    threadB.parar();

    threadA.wait();
    threadB.wait();

    close();
}

void MainWindow::updateLabelA(const QString &nuevoTexto)
{
    ui->labelA->setText(nuevoTexto);
}

void MainWindow::updateLabelB(const QString &nuevoTexto)
{
    ui->labelB->setText(nuevoTexto);
}

