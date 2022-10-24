#include "calendario.h"
#include "ui_calendario.h"

Calendario::Calendario(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::Calendario)
{
    ui->setupUi(this);
}

Calendario::~Calendario()
{
    delete ui;
}

void Calendario::diaSeleccionado(QVector<QString> eventos)
{
    for (int i = 0; i < eventos.size(); i++) {
        qDebug() << eventos[i];
    }
}
