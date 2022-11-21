#include <QtTest>

// Alt + Shift + 0

class TestQString : public QObject
{
    Q_OBJECT

private slots:
    void testToUpper();
    void testToUpper_data();
};

void TestQString::testToUpper()
{
    /*QString str = "Hola Mundo";

    QVERIFY(str.toUpper() == "HOLA MUNDO");

    QCOMPARE(str.toUpper(), "HOLA MUNDO");*/

    QFETCH(QString, original);
    QFETCH(QString, cambiadoAMayuscula);

    QBENCHMARK {
        QCOMPARE(original.toUpper(), cambiadoAMayuscula);
    }
}

void TestQString::testToUpper_data()
{
    QTest::addColumn<QString>("original");
    QTest::addColumn<QString>("cambiadoAMayuscula");

    QTest::addRow("todoEnMinuscula") << "hola mundo" << "HOLA MUNDO";
    QTest::addRow("mYMAlternadas") << "HoLa MuNdO" << "HOLA MUNDO";
    QTest::addRow("todoEnMayuscula") << "HOLA MUNDO" << "HOLA MUNDO";
}

QTEST_MAIN(TestQString);
#include "TestQString.moc"
