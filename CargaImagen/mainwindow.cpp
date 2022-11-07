#include "mainwindow.h"
#include "./ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    QPixmap imagen(QFileDialog::getOpenFileName());

    ui->label->setPixmap(imagen);
}

MainWindow::~MainWindow()
{
    delete ui;
}

