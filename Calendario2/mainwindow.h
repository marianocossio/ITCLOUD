#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QDate>

#include <QVector>
#include <QString>
#include <QFrame>
#include <QLabel>
#include <QFile>

#include "diacalendario.h"
#include "dialogoagregarevento.h"

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private:
    Ui::MainWindow *ui;

    /*QVector<QFrame*> representacionGraficaDias;
    QVector<QLabel*> numerosDias;*/

    QVector<DiaCalendario*> fechas;
    DialogoAgregarEvento dialogo;
    QFile manejadorArchivos;

    int indiceDiaSeleccionado;

private slots:
    void diaSeleccionado(int fechaDiaSeleccionado);
    void actualizarLabelEventos(const QVector<QString> &evs, int fecha);
    void agregarEventoADia();
};
#endif // MAINWINDOW_H
