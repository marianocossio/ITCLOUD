#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

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
    void on_miBoton_clicked();

    void on_miBoton_pressed();

    void on_miBoton_released();

    void on_edadEdit_textChanged(const QString &arg1);

    void on_edadSpinBox_valueChanged(int arg1);

    void on_horizontalSlider_valueChanged(int value);

private:
    Ui::MainWindow *ui;
};
#endif // MAINWINDOW_H
