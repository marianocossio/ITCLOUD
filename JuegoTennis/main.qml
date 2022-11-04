import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: "Juego de Tennis"

    Rectangle {
        id: cancha

        color: "#9DB577"

        anchors.fill: parent

        property color nuevoColor: "#9DB577"

        ContadorPuntos {
            id: puntosIzquierda

            width: cancha.width / 10
            height: width / 2

            anchors.left: cancha.horizontalCenter
            anchors.leftMargin: 2

            anchors.top: cancha.top
            anchors.topMargin: 5

            color: Qt.darker(cancha.color)
        }

        ContadorPuntos {
            id: puntosDerecha

            width: cancha.width / 10
            height: width / 2

            anchors.right: cancha.horizontalCenter
            anchors.rightMargin: 2

            anchors.top: cancha.top
            anchors.topMargin: 5

            color: Qt.lighter(cancha.color)
        }

        Raqueta {
            id: player1
            color: "#7796B5"

            anchors.left: parent.left
            anchors.leftMargin: 5

            width: cancha.width / 80
            height: cancha.height / 3

            up: Qt.Key_Q
            down: Qt.Key_A
        }

        Raqueta {
            id: player2
            color: "#B5A177"

            anchors.right: parent.right
            anchors.rightMargin: 5

            width: cancha.width / 80
            height: cancha.height / 3

            up: Qt.Key_P
            down: Qt.Key_L
        }

        focus: true

        Keys.onPressed: (event) => {
                            switch(event.key) {
                                case player1.up:
                                player1.y -= 10;
                                break;

                                case player1.down:
                                player1.y += 10;
                                break;

                                case player2.up:
                                player2.y -= 10;
                                break;

                                case player2.down:
                                player2.y += 10;
                                break;
                            }
                        }

        Image {
            id: hombrecito
            source: "hombrecito.png"

            x: 0
            y: 0

            width: parent.width / 10
            height: parent.width / 10

            property int nuevoX: 0
            property int nuevoY: 0
            property int nuevoAngulo: 0

            property int centro: (y + height / 2)

            NumberAnimation on x {
                id: animacionEnX

                to: hombrecito.nuevoX

                duration: 1980
            }


            NumberAnimation on y {
                id: animacionEnY

                to: hombrecito.nuevoY

                duration: 1980
            }

            RotationAnimation on rotation {
                id: animacionRotacion

                to: hombrecito.nuevoAngulo

                duration: 500
            }
        }

        ColorAnimation on color {
            id: animacionColor

            to: cancha.nuevoColor

            duration: 500
        }
    }

    Timer {
        id: temporizador
        interval: 2000
        running: true
        repeat: true

        onTriggered: {
            if (hombrecito.x == 0) {
                hombrecito.nuevoX = cancha.width - hombrecito.width;
                hombrecito.nuevoY = Math.random() * (cancha.height - hombrecito.height);

                hombrecito.nuevoAngulo = 90 +
                        Math.atan((hombrecito.nuevoY - hombrecito.y) / (hombrecito.nuevoX - hombrecito.x))
                        * (180 / Math.PI);

                cancha.nuevoColor = "#9DB577";

                if ((player1.y > hombrecito.centro) || ((player1.y + player1.height) < hombrecito.centro)) {
                    puntosIzquierda.puntos++;
                }
            }

            else {
                hombrecito.nuevoX = 0;
                hombrecito.nuevoY = Math.random() * (cancha.height - hombrecito.height);

                hombrecito.nuevoAngulo = -90 +
                        Math.atan((hombrecito.nuevoY - hombrecito.y) / (hombrecito.nuevoX - hombrecito.x))
                        * (180 / Math.PI);

                cancha.nuevoColor = "#A877B5";

                if ((player2.y > hombrecito.centro) || ((player2.y + player2.height) < hombrecito.centro)) {
                    puntosDerecha.puntos++;
                }
            }

            animacionEnX.start();
            animacionEnY.start();
            animacionRotacion.start();
            animacionColor.start();
        }
    }
}
