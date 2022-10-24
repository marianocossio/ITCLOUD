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
    for (int i = 0; i < renglones.size(); i++) {
        delete renglones[i];
    }

    delete ui;
}


void MainWindow::on_pushButton_clicked()
{
    renglones.append(new QLabel(ui->plainTextEdit->toPlainText(), ui->widget));

    renglones[renglones.size() - 1]->adjustSize();
    renglones[renglones.size() - 1]->move(0, (renglones.size() - 1) * renglones[renglones.size() - 1]->height() );
    renglones[renglones.size() - 1]->show();
}


void MainWindow::on_pushButton_2_clicked()
{
    //ui->label->clear();
}


void MainWindow::on_pushButton_3_clicked()
{
    /*QFile archivo(QFileDialog::getSaveFileName());

    archivo.open(QIODevice::WriteOnly);

    archivo.write(ui->label->text().toLatin1());

    archivo.close();*/
}

