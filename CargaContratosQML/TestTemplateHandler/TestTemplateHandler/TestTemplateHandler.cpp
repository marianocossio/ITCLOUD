#include <QtTest>

#include "../../templatehandler.h"

class TestTemplateHandler : public QObject
{
    Q_OBJECT

private slots:
    void initTestCase();
    void cleanupTestCase();

    void testObtenerCampos();
    void testObtenerCampos_data();

    QStringList obtenerCamposDeArchivo(const QString &file);
};



void TestTemplateHandler::initTestCase()
{
    QFile testFile1("testFile1.cont");
    testFile1.open(QIODevice::WriteOnly | QIODevice::Text);

    QTextStream textFile1(&testFile1);

    textFile1 << "texto###campo1###texto###campo2###texto###campo3###texto\n";

    testFile1.close();

    // -------------------------------------------------------------------------

    QFile testFile2("testFile2.cont");
    testFile2.open(QIODevice::WriteOnly | QIODevice::Text);

    QTextStream textFile2(&testFile2);

    textFile2 << "###campo1###texto###campo2###texto###campo3###texto\n";

    testFile2.close();
}

void TestTemplateHandler::cleanupTestCase()
{
    QFile::remove("testFile1.cont");
    QFile::remove("testFile2.cont");
}



void TestTemplateHandler::testObtenerCampos()
{
    QFETCH(QString, nombreArchivo);
    QFETCH(QStringList, camposObtenidos);

    QBENCHMARK {
        QCOMPARE(obtenerCamposDeArchivo(nombreArchivo), camposObtenidos);
    }
}

void TestTemplateHandler::testObtenerCampos_data()
{
    QTest::addColumn<QString>("nombreArchivo");
    QTest::addColumn<QStringList>("camposObtenidos");

    QStringList lista;
    lista.append("campo1");
    lista.append("campo2");
    lista.append("campo3");

    QTest::addRow("archivo1") << "testFile1.cont" << lista;
    QTest::addRow("archivo2") << "testFile2.cont" << lista;
}

QStringList TestTemplateHandler::obtenerCamposDeArchivo(const QString &file)
{
    TemplateHandler handler;

    handler.cargarTemplate(file);

    return handler.obtenerCampos();
}

QTEST_MAIN(TestTemplateHandler)
#include "TestTemplateHandler.moc"
