import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: "Semaforo"

    Rectangle {
        id: semaforo

        width: height / 2
        height: parent.height / 2

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10

        border.color: "black"
        border.width: 2

        color: "#AAAAAA"

        state: "rojoArribaVerdeAbajo"

        states: [
            State {
                name: "rojoArribaVerdeAbajo"

                PropertyChanges {
                    target: luz1
                    color: "red"
                }

                PropertyChanges {
                    target: luz2
                    color: "green"
                }
            },

            State {
                name: "verdeArribaRojoAbajo"

                PropertyChanges {
                    target: luz1
                    color: "green"
                }

                PropertyChanges {
                    target: luz2
                    color: "red"
                }
            }
        ]

        transitions: [
            Transition {
                from: "rojoArribaVerdeAbajo"
                to: "verdeArribaRojoAbajo"

                ColorAnimation {
                    target: luz1
                    properties: "color"
                    duration: 1000
                }

                ColorAnimation {
                    target: luz2
                    properties: "color"
                    duration: 1000
                }
            },

            Transition {
                from: "verdeArribaRojoAbajo"
                to: "rojoArribaVerdeAbajo"

                ColorAnimation {
                    target: luz1
                    properties: "color"
                    duration: 1000
                }

                ColorAnimation {
                    target: luz2
                    properties: "color"
                    duration: 1000
                }
            }
        ]

        Rectangle {
            id: luz1

            width: parent.width / 1.5
            height: parent.width / 1.5

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: height / 3

            color: "red"

            radius: width / 2

            border.color: "black"
            border.width: 2
        }

        Rectangle {
            id: luz2

            width: parent.width / 1.5
            height: parent.width / 1.5

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: height / 3

            color: "green"

            radius: width / 2

            border.color: "black"
            border.width: 2
        }
    }

    Rectangle {
        id: boton

        width: semaforo.width
        height: width / 2

        border.color: "black"
        border.width: 2

        color: "#CCCCCC"

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: semaforo.bottom
        anchors.topMargin: height

        Text {
            id: textoBoton
            text: "Cambiar"

            anchors.centerIn: parent

            color: Qt.darker(boton.color)

            font.pixelSize: boton.height / 3
        }

        MouseArea {
            anchors.fill: parent

            onClicked: {
                label.text = "Estado cambiado.";
                temporizadorSingleShot.start();

                semaforo.state = (semaforo.state === "rojoArribaVerdeAbajo") ? semaforo.state = "verdeArribaRojoAbajo" : semaforo.state = "rojoArribaVerdeAbajo";

                /*if (semaforo.state === "rojoArribaVerdeAbajo") {
                    semaforo.state = "verdeArribaRojoAbajo";
                }
                else {
                    semaforo.state = "rojoArribaVerdeAbajo";
                }*/
            }
        }
    }

    Text {
        id: label
        text: ""

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: boton.bottom
        anchors.topMargin: boton.height

        font.pixelSize: boton.height / 3
    }

    Timer {
        id: temporizadorSingleShot
        interval: 2000
        running: false
        repeat: false

        onTriggered: {
            label.text = "";
        }
    }
}
