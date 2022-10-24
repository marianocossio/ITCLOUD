#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    connect(ui->horizontalSlider, SIGNAL( valueChanged(int) ), ui->spinBox, SLOT( setValue(int) ));
    connect(ui->spinBox, SIGNAL(valueChanged(int)), ui->horizontalSlider, SLOT(setValue(int)));

    connect(ui->pushButton, SIGNAL(clicked()), this, SLOT(togglearWidgets()));
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::togglearWidgets()
{
    ui->horizontalSlider->setVisible( !ui->horizontalSlider->isVisible() );
    ui->spinBox->setVisible( !ui->spinBox->isVisible() );
}

