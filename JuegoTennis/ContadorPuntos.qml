import QtQuick 2.0

Item {
    id: contador

    width: 50
    height: 20

    property color color: "white"
    property int puntos: 0
    //property alias puntos: numero.text

    FontLoader {
        id: fuenteLetrero

        source: "ds_digital/DS-DIGI.TTF"
    }

    Rectangle {
        id: cuadro

        color: "transparent"

        border.color: Qt.lighter(contador.color)
        border.width: width / 100

        anchors.fill: parent

        Text {
            id: numero

            text: contador.puntos

            color: cuadro.border.color

            anchors.centerIn: parent

            font.pixelSize: contador.width / 5

            font.family: fuenteLetrero.font.family
        }
    }
}
