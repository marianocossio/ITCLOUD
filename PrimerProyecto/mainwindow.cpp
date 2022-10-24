#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_miBoton_clicked()
{
    ui->miLabel->setText(QString("<b>Nombre: </b>") + ui->nombreEdit->text());
}


void MainWindow::on_miBoton_pressed()
{
    ui->miLabel->setText("Boton Presionado");
}


void MainWindow::on_miBoton_released()
{
    ui->miLabel->setText("Boton soltado");
}


void MainWindow::on_edadEdit_textChanged(const QString &arg1)
{
    ui->edadSpinBox->setValue(arg1.toInt());
}


void MainWindow::on_edadSpinBox_valueChanged(int arg1)
{
    ui->edadEdit->setText(QString::number(arg1));
    ui->horizontalSlider->setValue(arg1);
}


void MainWindow::on_horizontalSlider_valueChanged(int value)
{
    ui->edadSpinBox->setValue(value);
}

