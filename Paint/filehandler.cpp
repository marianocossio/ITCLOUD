#include "filehandler.h"

FileHandler::FileHandler(QObject *parent)
    : QObject{parent}
{
    /*
    QFile file;                                         // atributos privados

    file.setFileName("texto.txt");                      // abrirArchivo
    file.open(QIODevice::WriteOnly | QIODevice::Text);  // abrirArchivo


    QTextStream out;                                    // atributos privados
    out.setDevice(&file);                               // abrirArchivo

    out << "The magic number is: " << 49 << "\n";       // escribir

    file.close();                                       // cerrarArchivo
    */
}

void FileHandler::escribir(int x, int y)
{
    texto << x << ", " << y << Qt::endl;
}

void FileHandler::abrirArchivo(QString nombre)
{
    manejador.setFileName(nombre);

    manejador.open(QFile::WriteOnly | QFile::Text);

    texto.setDevice(&manejador);
}

void FileHandler::cerrarArchivo()
{
    manejador.close();
}

bool FileHandler::archivoAbierto()
{
    return manejador.isOpen();
}
