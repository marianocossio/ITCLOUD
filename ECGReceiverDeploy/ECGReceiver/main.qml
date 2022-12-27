import QtQuick 2.15
import QtQuick.Window 2.15

import ECGReceiver.Interface
import QtMultimedia

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    SerialReceiver {
        id: serialReceiver

        property real threshold: 150
        property real zoom: 200

        onDataReceived: (data) => {
                            for (var i = 0; i < data.length; i++) {

                                canvas.graficar(data[i] * zoom);

                                if (((data[i] * zoom) > threshold) && (!beep.playing)) {
                                    beep.play();
                                }
                            }
                        }

        onPortError: {
            print("Port Error.");
        }
    }

    SoundEffect {
        id: beep

        source: "beep.wav"
    }

    Component.onCompleted: {
        serialReceiver.start("COM2", 115200);
    }

    Component.onDestruction: {
        serialReceiver.stop();
    }

    Rectangle {
        id: rectCanvas

        anchors.fill: parent
        anchors.margins: 5

        border.color: "darkgrey"
        border.width: 1

        color: "lightgrey"

        radius: 5

        Canvas {
            id: canvas

            anchors.fill: parent

            property real tiempoAnterior: 0
            property real valorAnterior: 0
            property real tiempo: 0
            property real valor: 0
            property real pasoTiempo: width / cantDatos
            property int cantDatos: 2500

            property color color: "green"

            onPaint: {
                var ctx = getContext('2d')
                ctx.lineWidth = 1.5
                ctx.strokeStyle = canvas.color
                ctx.beginPath()
                ctx.moveTo(tiempoAnterior, valorAnterior)
                tiempoAnterior = tiempo
                valorAnterior = canvas.height - valor
                ctx.lineTo(tiempoAnterior, valorAnterior)
                ctx.stroke()
            }

            function clearCanvas() {
                var ctx = getContext('2d');

                ctx.reset();
            }

            function graficar(dato) {
                canvas.tiempo += canvas.pasoTiempo;
                canvas.valor = dato;

                if (canvas.tiempo > canvas.width) {
                    canvas.tiempoAnterior = 0;
                    canvas.tiempo = 0;

                    clearCanvas();
                }

                canvas.requestPaint();
            }
        }
    }
}
