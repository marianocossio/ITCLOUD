import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: ventana
    width: 640
    height: 480
    visible: true
    title: "Cambiar color de Texto"

    Rectangle {
        anchors.fill: parent

        Rectangle {
            width: ventana.width / 10
            height: ventana.height / 8

            id: hombrecito

            Image {
                id: imagenHombrecito
                source: "/img/hombrecito.png"
                scale: ventana.width / (10 * width)

                anchors.fill: parent
            }
        }

        Text {
            id: textoQueCambia

            text: "Seleccione un color"
            color: "black"

            anchors.centerIn: parent

            font.pointSize: 30
            font.bold: true
        }

        Grid {
            id: colorPicker

            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 10
            anchors.bottomMargin: 10

            rows: 2
            columns: 3

            spacing: 2

            Celda {
                colorCelda: "darkblue"
                onClicked: (colorRecibido) => {
                               textoQueCambia.color = colorRecibido;
                           }
            }

            Celda {
                colorCelda: "darkkhaki"
                onClicked: (colorRecibido) => {
                               textoQueCambia.color = colorRecibido;
                           }
            }

            Celda {
                colorCelda: "green"
                onClicked: (colorRecibido) => {
                               textoQueCambia.color = colorRecibido;
                           }
            }

            Celda {
                colorCelda: "lightcoral"
                onClicked: (colorRecibido) => {
                               textoQueCambia.color = colorRecibido;
                           }
            }

            Celda {
                colorCelda: "maroon"
                onClicked: (colorRecibido) => {
                               textoQueCambia.color = colorRecibido;
                           }
            }

            Celda {
                colorCelda: "olivedrab"
                onClicked: (colorRecibido) => {
                               textoQueCambia.color = colorRecibido;
                           }
            }
        }

        focus: true

        Keys.onPressed: (event) => {
                            switch(event.key) {
                                case Qt.Key_Left:
                                    hombrecito.x -= 5
                                    imagenHombrecito.mirror = true

                                    textoQueCambia.text = hombrecito.mapToItem(colorPicker, hombrecito.x, hombrecito.y).x
                                + ", " + hombrecito.mapToItem(colorPicker, hombrecito.x, hombrecito.y).y;
                                    break;
                                case Qt.Key_Right:
                                    hombrecito.x += 5
                                    imagenHombrecito.mirror = false

                                textoQueCambia.text = hombrecito.mapToItem(colorPicker, hombrecito.x, hombrecito.y).x
                            + ", " + hombrecito.mapToItem(colorPicker, hombrecito.x, hombrecito.y).y;
                                    break;
                                case Qt.Key_Up:
                                    hombrecito.y -= 5

                                textoQueCambia.text = hombrecito.mapToItem(colorPicker, hombrecito.x, hombrecito.y).x
                            + ", " + hombrecito.mapToItem(colorPicker, hombrecito.x, hombrecito.y).y;
                                    break;
                                case Qt.Key_Down:
                                    hombrecito.y += 5

                                textoQueCambia.text = hombrecito.mapToItem(colorPicker, hombrecito.x, hombrecito.y).x
                            + ", " + hombrecito.mapToItem(colorPicker, hombrecito.x, hombrecito.y).y;
                                    break;
                            }
                        }
    }
}
