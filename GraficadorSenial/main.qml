import QtQuick 2.15
import QtQuick.Window 2.15
import filehandler

Window {
    width: 640
    height: 480
    visible: true
    title: "Graficador Señal"

    Rectangle {
        id: ventana

        anchors.fill: parent

        Rectangle {
            id: grafico

            color: "#EFF0F1"

            border.color: Qt.darker(color)
            border.width: 1

            anchors.top: ventana.top
            anchors.bottom: boton.top
            anchors.horizontalCenter: ventana.horizontalCenter

            width: ventana.width - anchors.margins * 2

            anchors.margins: 5

            Canvas {
                id: canvasGrafico

                anchors.fill: parent

                property real ultimoY: height / 2
                property real ultimoX: 0

                onPaint: {
                    if(lectorSignal.isOpen()) {
                        var ctx = getContext("2d");

                        ctx.lineWidth = 1;
                        ctx.strokeStyle = "#DF89C4";

                        ctx.beginPath();
                        ctx.moveTo(ultimoX, ultimoY);

                        ultimoX += width / lectorSignal.cantMuestras;
                        ultimoY = lectorSignal.read() * 100;

                        ctx.lineTo(ultimoX, ultimoY);

                        ctx.stroke();
                    }
                }

                function reset() {
                    var ctx = getContext("2d");

                    ctx.reset();

                    ultimoX = 0;

                    requestPaint();
                }
            }
        }

        Rectangle {
            id: boton

            width: 100
            height: 50

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.margins: 5

            color: "#CDE3F4"

            border.color: Qt.darker(color)
            border.width: 1

            Text {
                id: textoBoton
                text: "Comenzar"

                anchors.centerIn: parent

                font.pointSize: 12

                color: Qt.darker(boton.color)
            }

            MouseArea {
                id: mouseAreaBoton

                anchors.fill: parent

                onClicked: {
                    canvasGrafico.reset();

                    if (lectorSignal.isOpen()) {
                        lectorSignal.closeFile();
                    }

                    lectorSignal.openFile("signal.txt");
                    timer.start();
                }
            }
        }
    }

    ManejadorArchivos {
        id: lectorSignal
    }

    Timer {
        id: timer

        repeat: true

        running: false

        interval: 10

        onTriggered: {
            if (lectorSignal.isOpen()) {
                canvasGrafico.requestPaint();
                //console.log(lectorSignal.read());
            }
        }
    }
}
