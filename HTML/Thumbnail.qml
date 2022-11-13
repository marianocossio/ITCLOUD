import QtQuick 2.0

Item {

    property alias text: texto.text
    property alias iconSource: imagen.source
    //property alias iconSource: imagen.text

    Rectangle {
        id: contenedor

        anchors.fill: parent
        anchors.bottomMargin: 20

        Image {
            id: imagen

            source: ""

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top

            anchors.fill: parent

            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: texto
            text: ""

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: imagen.bottom

            width: parent.width
            height: 20

            horizontalAlignment: Text.AlignHCenter
        }
    }
}
