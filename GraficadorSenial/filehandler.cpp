#include "filehandler.h"

FileHandler::FileHandler(QObject *parent)
    : QObject{parent}
{
    cantMuestras = 501;
}

void FileHandler::openFile(const QString &fileName)
{
    handler.setFileName(fileName);

    handler.open(QFile::ReadOnly | QFile::Text);

    stream.setDevice(&handler);
    stream.seek(0);
}

void FileHandler::closeFile()
{
    handler.close();
}

float FileHandler::read()
{
    QString data;

    data = stream.readLine();

    if (data.isNull()) {
        handler.close();

        return -1;
    }

    return data.toFloat();
}

bool FileHandler::isOpen()
{
    return handler.isOpen();
}

float FileHandler::getCantMuestras()
{
    return cantMuestras;
}

void FileHandler::setCantMuestras(qreal muestras)
{
    cantMuestras = muestras;
}
