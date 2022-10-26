#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->pushButton_4->setEnabled(false);
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
    renglones.append( new QLabel(ui->plainTextEdit->toPlainText(), ui->widget) );

    renglones[renglones.size() - 1]->adjustSize();
    renglones[renglones.size() - 1]->move(0, (renglones.size() - 1) * renglones[renglones.size() - 1]->height() );
    renglones[renglones.size() - 1]->show();
}

void MainWindow::on_pushButton_2_clicked()
{
    for (int i = 0; i < renglones.size(); i++) {
        delete renglones[i];
    }

    renglones.clear();
}


void MainWindow::on_pushButton_3_clicked()
{
    QFile archivo(QFileDialog::getSaveFileName());

    archivo.open(QIODevice::WriteOnly);    

    for (int i = 0; i < renglones.size(); i++) {
        archivo.write(renglones[i]->text().toLatin1() + "\n");
    }

    archivo.close();
}

void MainWindow::mouseReleaseEvent(QMouseEvent *event)
{
    for (int i = 0; i < renglones.size(); i++) {
        if (renglones[i]->underMouse()) {

            if (seleccionados.contains(i)) {
                renglones[i]->setStyleSheet("QLabel { background-color: white; }");
                seleccionados.remove( seleccionados.indexOf(i) );

                if (seleccionados.isEmpty()) {
                    ui->pushButton_4->setEnabled(false);
                }
            }

            else {
                renglones[i]->setStyleSheet("QLabel { background-color: blue; }");
                seleccionados.append(i);
                ui->pushButton_4->setEnabled(true);
            }
        }
    }
}


void MainWindow::on_pushButton_4_clicked()
{
    for (int i = 0; i < seleccionados.size(); i++) {
        for (int j = 0; j < (seleccionados.size() - 1); j++) {
            if (seleccionados[j] > seleccionados[j + 1]) {
                int aux = seleccionados[j];
                seleccionados[j] = seleccionados[j + 1];
                seleccionados[j + 1] = aux;
            }
        }
    }

    int cantidadBorrados = 0;

    for (int i = 0; i < seleccionados.size(); i++) {
        delete renglones[ seleccionados[i] - cantidadBorrados ];
        renglones.remove( seleccionados[i] - cantidadBorrados );

        cantidadBorrados++;
    }

    for (int i = 0; i < renglones.size(); i++) {
        renglones[i]->move(0, i * renglones[i]->height());
    }
}

