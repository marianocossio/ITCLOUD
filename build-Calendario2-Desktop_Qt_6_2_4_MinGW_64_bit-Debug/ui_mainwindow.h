/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 6.2.4
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QLabel>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenu>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QAction *action_Exportar;
    QWidget *centralwidget;
    QWidget *widgetCalendario;
    QLabel *eventosLabel;
    QStatusBar *statusbar;
    QMenuBar *menubar;
    QMenu *menu_Archivo;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QString::fromUtf8("MainWindow"));
        MainWindow->resize(995, 819);
        action_Exportar = new QAction(MainWindow);
        action_Exportar->setObjectName(QString::fromUtf8("action_Exportar"));
        centralwidget = new QWidget(MainWindow);
        centralwidget->setObjectName(QString::fromUtf8("centralwidget"));
        widgetCalendario = new QWidget(centralwidget);
        widgetCalendario->setObjectName(QString::fromUtf8("widgetCalendario"));
        widgetCalendario->setGeometry(QRect(10, 10, 700, 600));
        eventosLabel = new QLabel(centralwidget);
        eventosLabel->setObjectName(QString::fromUtf8("eventosLabel"));
        eventosLabel->setGeometry(QRect(820, 20, 49, 16));
        MainWindow->setCentralWidget(centralwidget);
        statusbar = new QStatusBar(MainWindow);
        statusbar->setObjectName(QString::fromUtf8("statusbar"));
        MainWindow->setStatusBar(statusbar);
        menubar = new QMenuBar(MainWindow);
        menubar->setObjectName(QString::fromUtf8("menubar"));
        menubar->setGeometry(QRect(0, 0, 995, 21));
        menu_Archivo = new QMenu(menubar);
        menu_Archivo->setObjectName(QString::fromUtf8("menu_Archivo"));
        MainWindow->setMenuBar(menubar);

        menubar->addAction(menu_Archivo->menuAction());
        menu_Archivo->addAction(action_Exportar);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QCoreApplication::translate("MainWindow", "MainWindow", nullptr));
        action_Exportar->setText(QCoreApplication::translate("MainWindow", "&Exportar", nullptr));
#if QT_CONFIG(tooltip)
        action_Exportar->setToolTip(QCoreApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-weight:700;\">Exportar a PDF</span></p></body></html>", nullptr));
#endif // QT_CONFIG(tooltip)
#if QT_CONFIG(shortcut)
        action_Exportar->setShortcut(QCoreApplication::translate("MainWindow", "Ctrl+E", nullptr));
#endif // QT_CONFIG(shortcut)
        eventosLabel->setText(QString());
        menu_Archivo->setTitle(QCoreApplication::translate("MainWindow", "&Archivo", nullptr));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
