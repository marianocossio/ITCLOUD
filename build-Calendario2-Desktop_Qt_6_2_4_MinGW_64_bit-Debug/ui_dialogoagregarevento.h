/********************************************************************************
** Form generated from reading UI file 'dialogoagregarevento.ui'
**
** Created by: Qt User Interface Compiler version 6.2.4
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_DIALOGOAGREGAREVENTO_H
#define UI_DIALOGOAGREGAREVENTO_H

#include <QtCore/QVariant>
#include <QtWidgets/QAbstractButton>
#include <QtWidgets/QApplication>
#include <QtWidgets/QDialog>
#include <QtWidgets/QDialogButtonBox>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_DialogoAgregarEvento
{
public:
    QWidget *widget;
    QVBoxLayout *verticalLayout;
    QLabel *label;
    QLineEdit *lineEdit;
    QDialogButtonBox *buttonBox;

    void setupUi(QDialog *DialogoAgregarEvento)
    {
        if (DialogoAgregarEvento->objectName().isEmpty())
            DialogoAgregarEvento->setObjectName(QString::fromUtf8("DialogoAgregarEvento"));
        DialogoAgregarEvento->resize(398, 104);
        widget = new QWidget(DialogoAgregarEvento);
        widget->setObjectName(QString::fromUtf8("widget"));
        widget->setGeometry(QRect(20, 10, 361, 78));
        verticalLayout = new QVBoxLayout(widget);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        verticalLayout->setContentsMargins(0, 0, 0, 0);
        label = new QLabel(widget);
        label->setObjectName(QString::fromUtf8("label"));

        verticalLayout->addWidget(label);

        lineEdit = new QLineEdit(widget);
        lineEdit->setObjectName(QString::fromUtf8("lineEdit"));

        verticalLayout->addWidget(lineEdit);

        buttonBox = new QDialogButtonBox(widget);
        buttonBox->setObjectName(QString::fromUtf8("buttonBox"));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Cancel|QDialogButtonBox::Ok);

        verticalLayout->addWidget(buttonBox);


        retranslateUi(DialogoAgregarEvento);
        QObject::connect(buttonBox, &QDialogButtonBox::accepted, DialogoAgregarEvento, qOverload<>(&QDialog::accept));
        QObject::connect(buttonBox, &QDialogButtonBox::rejected, DialogoAgregarEvento, qOverload<>(&QDialog::reject));

        QMetaObject::connectSlotsByName(DialogoAgregarEvento);
    } // setupUi

    void retranslateUi(QDialog *DialogoAgregarEvento)
    {
        DialogoAgregarEvento->setWindowTitle(QCoreApplication::translate("DialogoAgregarEvento", "Dialog", nullptr));
        label->setText(QCoreApplication::translate("DialogoAgregarEvento", "Evento nuevo:", nullptr));
    } // retranslateUi

};

namespace Ui {
    class DialogoAgregarEvento: public Ui_DialogoAgregarEvento {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DIALOGOAGREGAREVENTO_H
