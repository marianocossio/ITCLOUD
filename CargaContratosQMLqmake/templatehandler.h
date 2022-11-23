#ifndef TEMPLATEHANDLER_H
#define TEMPLATEHANDLER_H

#include <QString>
#include <QFile>
#include <QMap>
#include <QTextStream>
#include <QFile>
#include <QtPrintSupport/QPrinter>

class TemplateHandler
{
public:
    TemplateHandler();

    bool cargarTemplate(const QString &file);
    QStringList obtenerCampos();
    void completarCampo(const QString &campo, const QString &contenido);
    bool guardar(const QString &file);

private:
    QStringList partesPlantilla;
    QStringList tagsCampos;
    QMap<QString, QString> campos;
};

#endif // TEMPLATEHANDLER_H
