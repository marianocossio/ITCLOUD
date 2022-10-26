#include "widgetcampos.h"

WidgetCampos::WidgetCampos(QWidget *parent)
    : QWidget{parent}
{
    layout = new QVBoxLayout(this);
}

WidgetCampos::~WidgetCampos()
{
    for (int i = 0; i < campos.size(); i++) {
        delete campos[i];
    }

    delete layout;
}

void WidgetCampos::agregarCampo(QString label)
{
    campos.append(new Campo(this));

    campos[campos.size() - 1]->setLabelText(label);

    layout->addWidget(campos[campos.size() - 1]);
}

int WidgetCampos::cantCampos()
{
    return campos.size();
}

QString WidgetCampos::labelAt(int i)
{
    QString resultado = "";

    if (i < campos.size()) {
        resultado = campos[i]->getLabelText();
    }

    return resultado;
}

QString WidgetCampos::textAt(int i)
{
    QString resultado = "";

    if (i < campos.size()) {
        resultado = campos[i]->getLineEditText();
    }

    return resultado;
}

int WidgetCampos::encontrar(QString label)
{
    int indice = -1;

    for (int i = 0; i < campos.size(); i++) {
        if (campos[i]->getLabelText() == label) {
            indice = i;
        }
    }

    return indice;
}
