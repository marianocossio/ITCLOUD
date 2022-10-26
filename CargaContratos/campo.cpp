#include "campo.h"

Campo::Campo(QWidget *parent)
    : QWidget{parent}
{    
    label.setParent(this);
    lineEdit.setParent(this);

    label.setText("label");
    label.adjustSize();
    label.move(10, 0);
    label.setFixedHeight(label.height());

    lineEdit.setText("label");
    lineEdit.adjustSize();
    lineEdit.move(0, label.height() + 5);
    lineEdit.setFixedHeight(lineEdit.height());

    setFixedHeight(label.height() + 10 + lineEdit.height());

    lineEdit.setText("");
}

void Campo::setLabelText(QString text)
{
    label.setText(text);
}

QString Campo::getLabelText()
{
    return label.text();
}

QString Campo::getLineEditText()
{
    return lineEdit.text();
}

void Campo::resizeEvent(QResizeEvent *event)
{
    label.resize(width(), label.height());
    lineEdit.resize(width(), lineEdit.height());
}
