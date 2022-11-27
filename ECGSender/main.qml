import QtQuick 2.15
import QtQuick.Window 2.15

import ECGSender.Interface

Window {
    width: 640
    height: 480
    visible: true
    title: "ECG Simulator"

    SerialSender {
        id: serialSender

        onStarted: {
            timer.start();
        }

        onStopped: {
            timer.stop();
        }
    }

    Boton {
        id: botonComenzar

        texto: "COMENZAR"

        anchors.centerIn: parent

        onClicked: {
            serialSender.start("ECG.txt", "COM1", 500, 115200);
        }
    }

    Timer {
        id: timer

        interval: 10

        repeat: true

        onTriggered: {
            tiempo.tiempoTranscurrido += 0.01;
        }
    }

    Text {
        id: tiempo

        property real tiempoTranscurrido: 0.0

        text: tiempoTranscurrido

        width: 100
        height: 50

        anchors.right: parent.right
        anchors.top: parent.top

        font.pixelSize: 30
    }
}
