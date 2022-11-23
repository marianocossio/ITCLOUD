#include "templatehandler.h"

TemplateHandler::TemplateHandler()
{

}

bool TemplateHandler::cargarTemplate(const QString &file)
{
    QFile archivo(file);

    if (archivo.open(QIODevice::ReadOnly | QIODevice::Text)) {
        QString textoLeido = archivo.readAll();

        partesPlantilla = textoLeido.split("###");

        int campoParaCompletar = 1;

        /*if (textoLeido.startsWith("###")) {
            campoParaCompletar = 0;
        }*/

        for(; campoParaCompletar < partesPlantilla.size(); campoParaCompletar += 2) {
            // Corroboramos que el campo no exista. Que no haya sido leido previamente.
            // Guardamos el indice para almacenarlo en indicesCampos

            if (!tagsCampos.contains(partesPlantilla[campoParaCompletar])) {
                tagsCampos.append(partesPlantilla[campoParaCompletar]);

                campos[ partesPlantilla[campoParaCompletar] ] = "";
            }
        }

        return true;
    }

    else return false;
}

QStringList TemplateHandler::obtenerCampos()
{
    return tagsCampos;
}

void TemplateHandler::completarCampo(const QString &campo, const QString &contenido)
{
    if (tagsCampos.contains(campo)) {
        campos[campo] = contenido;
    }
}

bool TemplateHandler::guardar(const QString &file)
{
    for (int i = 1 ; i < partesPlantilla.size(); i += 2) {
        partesPlantilla[i] = campos[ partesPlantilla[i] ];
    }

    // Archivo de texto
    QFile archivo(file);
    if (archivo.open(QIODevice::WriteOnly | QIODevice::Text)) {

        QTextStream textoArchivo(&archivo);

        textoArchivo << partesPlantilla.join("");

        archivo.close();

        return true;
    }

    else return false;
}
