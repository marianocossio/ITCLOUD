import QtQuick

Item {
    id: campo

    property alias color: fieldRect.color
    property alias label: fieldLabel.text
    property alias input: fieldInput.text
    property alias echoMode: fieldInput.echoMode
    property alias horizontalAlignment: fieldInput.horizontalAlignment
    property alias radius: fieldRect.radius

    property bool clickeable: true

    height: 60
    width: 200

    signal campoSeleccionado()

    Rectangle {
        id: fieldRect

        anchors.fill: parent

        radius: campo.height * 0.08

        color: "lightgrey"

        Text {
            id: fieldLabel

            text: ""

            height: campo.height * 0.3

            anchors.top: parent.top
            anchors.left: parent.left
            verticalAlignment: TextInput.AlignVCenter

            anchors.margins: campo.height * 0.08
        }

        Rectangle {
            width: parent.width
            height: campo.height * 0.46

            anchors.top: fieldLabel.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: campo.height * 0.08
            radius: campo.height * 0.08

            TextInput {
                id: fieldInput

                anchors.fill: parent
                verticalAlignment: TextInput.AlignVCenter

                anchors.leftMargin: campo.height * 0.08

                font.pixelSize: height * 0.5

                MouseArea {
                    id: mouseAreaTextInput

                    anchors.fill: parent

                    hoverEnabled: true

                    cursorShape: Qt.IBeamCursor

                    onClicked: {
                        if (campo.clickeable) {
                            forceActiveFocus();
                            fieldInput.focus = true;
                        }

                        campo.campoSeleccionado();
                    }
                }
            }
        }
    }
}
