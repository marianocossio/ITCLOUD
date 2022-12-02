#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

#include "ecgreceiver.h"

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

    ECGReceiver receiver;

    // QWidget interface
protected:
    void resizeEvent(QResizeEvent *event) override;

private slots:
    void agregarDato(const QVariantList &nuevosDatos);
};
#endif // MAINWINDOW_H
