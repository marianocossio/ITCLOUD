#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

#include "thread.h"

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void on_botonA_clicked();

    void on_botonB_clicked();

    void on_pushButton_clicked();

    void updateLabelA(const QString& nuevoTexto);
    void updateLabelB(const QString& nuevoTexto);

private:
    Ui::MainWindow *ui;

    Thread threadA;
    Thread threadB;
};
#endif // MAINWINDOW_H
