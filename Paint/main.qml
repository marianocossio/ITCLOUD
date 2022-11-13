import QtQuick 2.15
import QtQuick.Window 2.15
import paint.filehandler

Window {
    width: 640
    height: 480
    visible: true
    title: "Paint"

    Rectangle {
        anchors.fill: parent
        anchors.centerIn: parent

        id: ventana

        Rectangle {
            id: rectanguloColores

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top

            height: parent.height / 8
            width: parent.height / 2

            ListView {
                id: colores

                anchors.fill: parent
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter

                spacing: 5

                orientation: ListView.Horizontal

                property color colorPincel: "#E4320B"

                model: ["#E4320B", "#4EE558", "#264BEE", "#C31FE9"]

                clip: false

                delegate: Rectangle {
                    id: pincel

                    width: colores.height
                    height: colores.height

                    required property color modelData

                    color: modelData

                    border {
                        color: Qt.darker(color)
                        width: 2
                    }

                    MouseArea {
                        id: areaColor

                        anchors.fill: parent

                        onClicked: {
                            colores.colorPincel = pincel.modelData;
                        }
                    }
                }
            }
        }

        Rectangle {
            id: areaDibujo

            anchors {
                top: rectanguloColores.bottom
                bottom: botonGuardar.top
                horizontalCenter: ventana.horizontalCenter
                margins: 5
            }

            width: ventana.width - 10

            color: "#eeeeee"

            border.color: "grey"
            border.width: 2

            Canvas {
                id: canvasDibujo

                anchors.fill: parent

                property color color: colores.colorPincel
                property real ultimoX
                property real ultimoY

                onPaint: {
                    var ctx = getContext('2d');

                    ctx.lineWidth = 2;
                    ctx.strokeStyle = canvasDibujo.color;

                    ctx.beginPath();
                    ctx.moveTo(ultimoX, ultimoY);
                    ctx.lineTo(mouseAreaDibujo.mouseX, mouseAreaDibujo.mouseY);

                    ultimoX = mouseAreaDibujo.mouseX;
                    ultimoY = mouseAreaDibujo.mouseY;

                    ctx.stroke();

                    if (archivador.archivoAbierto()){
                        archivador.escribir(ultimoX, ultimoY);
                    }
                }
            }

            MouseArea {
                id: mouseAreaDibujo

                anchors.fill: parent

                onPressed: {
                    canvasDibujo.ultimoX = mouseX;
                    canvasDibujo.ultimoY = mouseY;
                }

                onPositionChanged: {
                    if (pressed) {
                        canvasDibujo.requestPaint();
                    }
                }

                hoverEnabled: true

                onContainsMouseChanged: {
                    console.log("contains");
                }

                cursorShape: Qt.CrossCursor;
            }
        }

        Rectangle {
            id: botonGuardar

            color: "#6D74A4"

            width: 100
            height: 50

            border.color: Qt.darker(color)
            border.width: 2

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.margins: 5

            Text {
                id: textoBoton

                text: "Guardar"

                anchors.centerIn: parent

                font.pointSize: 12
            }

            MouseArea {
                id: mouseAreaBoton

                anchors.fill: parent

                onClicked: {
                    areaDibujo.grabToImage(
                              (result) => {
                                    result.saveToFile("dibujo.png");
                              }
                                );

                    timer.start();
                }
            }
        }

        Rectangle {
            id: botonRecord

            width: 100
            height: 50

            color: "#DA4C0C"

            border.color: Qt.darker(color)
            border.width: 2

            anchors.left: botonGuardar.right
            anchors.bottom: parent.bottom

            anchors.margins: 5

            Text {
                id: textoBotonRecord

                text: "Grabar"

                font.pointSize: 12

                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    if (!archivador.archivoAbierto()) {
                        archivador.abrirArchivo("registroMouse.txt");
                        textoBotonRecord.text = "Parar";
                    }
                    else {
                        archivador.cerrarArchivo();
                        textoBotonRecord.text = "Grabar";
                    }
                }
            }
        }

        Timer {
            id: timer

            interval: 1000
            running: false
            repeat: true

            onTriggered: {
                botonGuardar.color = (botonGuardar.color == "#6D74A4" ? "#097F58" : "#6D74A4");
                console.log("timer");
            }
        }
    }

    ManejadorArchivos {
        id: archivador
    }
}
