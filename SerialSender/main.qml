import QtQuick
import QtQuick.Window
import QtQuick.Controls

import mi.clase

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    color: "lightgrey"

    property var availablePorts

    menuBar: MenuBar {
        Menu {
            title: "&Archivo"

            Menu {
                id: menuPuertos
                title: "&Puerto"

                width: 80

                ListView {
                    id: vistaPuertos

                    width: 80

                    model: availablePorts

                    delegate: Rectangle {
                        id: delegateRectangle

                        width: parent.width
                        height: 30

                        CheckBox {
                            id: checkBox

                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                        }

                        Text {
                            id: nombrePuerto
                            text: modelData

                            anchors.verticalCenter: parent.verticalCenter

                            anchors.left: checkBox.right
                        }

                        MouseArea {
                            anchors.fill: parent

                            hoverEnabled: true

                            onClicked: {
                                comunicadorSerie.portName = modelData;

                                checkBox.toggle();

                                if (checkBox.checked) {
                                    comunicadorSerie.openPort();
                                }

                                else {
                                    comunicadorSerie.closePort();
                                }
                            }

                            onEntered: {
                                delegateRectangle.color = "steelblue";
                            }

                            onExited: {
                                delegateRectangle.color = "white";
                            }


                        }
                    }
                }
            }

            MenuSeparator {}

            MenuItem {
                text: "&Salir"

                onTriggered: {
                    Qt.quit();
                }
            }
        }
    }

    /*Component {
        id: menuItem

        MenuItem {

        }
    }*/

    SerialCommunicator {
        id: comunicadorSerie

        onPortNameChanged: (nombrePuerto) => {
            print("Desde onPortNameChanged: " + nombrePuerto)
        }

        onValueReceived: (valor) => {
                             datoPuertoSerie.text += String.fromCharCode(valor);
                         }
    }

    Component.onCompleted: {
        availablePorts = comunicadorSerie.listAvailablePorts();

        vistaPuertos.height = 30 * availablePorts.length;

        /*for (var i = 0; i < availablePorts.length; i++) {
            menuPuertos.addItem( menuItem.createObject(menuPuertos, { text: availablePorts[i], onTriggered: Qt.quit() }) );
        }*/
    }

    Component.onDestruction: {
        comunicadorSerie.closePort();
    }

    Rectangle {
        id: contenedor

        anchors.top: parent.top
        anchors.bottom: contenedorSender.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 20

        color: "white"
        radius: 10

        Text {
            id: datoPuertoSerie
            text: ""

            anchors.fill: parent
            anchors.margins: 10
        }
    }

    Rectangle {
        id: contenedorSender

        anchors.bottom: botonSend.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 20

        height: 40

        color: "white"
        radius: 10

        TextInput {
            id: datosEnviados

            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 10

            MouseArea {
                anchors.fill: parent

                hoverEnabled: true

                cursorShape: Qt.IBeamCursor

                onClicked: {
                    datosEnviados.focus = true;
                }
            }
        }
    }

    Boton {
        id: botonSend

        texto: "ENVIAR"

        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 20

        onClicked: {
            comunicadorSerie.sendString(datosEnviados.text);
        }
    }
}
