/********************************************************************************
** Form generated from reading UI file 'calendario.ui'
**
** Created by: Qt User Interface Compiler version 6.2.4
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_CALENDARIO_H
#define UI_CALENDARIO_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_Calendario
{
public:

    void setupUi(QWidget *Calendario)
    {
        if (Calendario->objectName().isEmpty())
            Calendario->setObjectName(QString::fromUtf8("Calendario"));
        Calendario->resize(400, 300);

        retranslateUi(Calendario);

        QMetaObject::connectSlotsByName(Calendario);
    } // setupUi

    void retranslateUi(QWidget *Calendario)
    {
        Calendario->setWindowTitle(QCoreApplication::translate("Calendario", "Form", nullptr));
    } // retranslateUi

};

namespace Ui {
    class Calendario: public Ui_Calendario {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_CALENDARIO_H
