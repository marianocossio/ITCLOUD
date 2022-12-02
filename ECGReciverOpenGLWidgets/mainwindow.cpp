#include "mainwindow.h"
#include "./ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    receiver.start("COM2", QSerialPort::Baud115200);

    connect(&receiver, SIGNAL(dataReceived(QVariantList)), this, SLOT(agregarDato(QVariantList)));
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::resizeEvent(QResizeEvent *event)
{
    ui->graphicWidget->resize(width() - 10, height() - 10);
    ui->graphicWidget->move(5, 5);
}

void MainWindow::agregarDato(const QVariantList &nuevosDatos)
{
    for (int i = 0; i < nuevosDatos.size(); i++)
    {
        ui->graphicWidget->addData(nuevosDatos[i].toFloat());
    }
}

