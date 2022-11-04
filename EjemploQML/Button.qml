import QtQuick 2.0

Item {
    id: btn

    width: 100
    height: 50

    property alias textoMostrado: textoButton.text
    property alias colorBoton: button.color
    signal clicked()

    Rectangle {
        id: button

        width: parent.width
        height: 30

        y: 5

        color: "green"
        border.color: Qt.darker(color)
        border.width: 2

        Text {
            id: textoButton
            text: "Boton"

            anchors.centerIn: parent
        }

        MouseArea {
            anchors.fill: parent

            onClicked: {
                btn.clicked();
                label.cantPresionesBoton++;
            }
        }
    }

    Text {
        id: label

        property int cantPresionesBoton

        text: "Boton presionado " + cantPresionesBoton + " veces."

        anchors.horizontalCenter: parent.horizontalCenter
        y: button.y + button.height + 10

        color: Qt.lighter(button.color)
    }
}
