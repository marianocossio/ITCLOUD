#include "templatehandlerinterface.h"

TemplateHandlerInterface::TemplateHandlerInterface(QObject *parent)
    : QObject{parent}
{

}

bool TemplateHandlerInterface::cargarTemplate(const QString &file)
{
    return handler.cargarTemplate(file);
}

QStringList TemplateHandlerInterface::obtenerCampos()
{
    return handler.obtenerCampos();
}

void TemplateHandlerInterface::completarCampo(const QString &campo, const QString &contenido)
{
    handler.completarCampo(campo, contenido);
}

void TemplateHandlerInterface::guardarPDF(const QString &file)
{
    handler.guardarPDF(file);
}

bool TemplateHandlerInterface::guardarTXT(const QString &file)
{
    return handler.guardarTXT(file);
}
