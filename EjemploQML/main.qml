import QtQuick
import QtQuick.Window

Window {
    id: ventana
    width: 640
    height: 480
    visible: true
    title: "Primer Proyecto"

    color: "cornflowerblue"

    Rectangle {
        id: rectangulo

        width: parent.width / 2
        height: parent.height / 4

        x: (parent.width - width) / 2
        y: 5

        color: "#4A4A4A"

        border.color: "green"
        border.width: 8

        radius: 10

        Text {
            id: textoDentroDeRectanguloGris
            text: "Dentro del rectangulo"
            x: 10
            y: 10
        }

        MouseArea {
            id: areaMouseRectangulo
            anchors.fill: parent

            onClicked: imagenHombrecito.visible = !imagenHombrecito.visible
        }
    }

    Rectangle {
        id: imagenHombrecito
        width: 144
        height: 100

        x: (ventana.width - width) / 2
        y: texto.y + texto.height + 20

        Image {
            id: hombrecito
            source: "https://i.pinimg.com/originals/56/56/4f/56564f8f3ac3de1cb00332cb1194f4ed.jpg"

            anchors.fill: parent
        }
    }

    Text {
        id: texto
        text: "Apretaste espacio " + presionesEspacio + " veces."

        property int presionesEspacio

        font.pixelSize: 25
        font.family: "Courier"

        width: parent.width
        horizontalAlignment: Text.AlignHCenter

        y: rectangulo.y + rectangulo.height + 10

        focus: true

        elide: Text.ElideMiddle

        Keys.onSpacePressed: presionesEspacio++

        Keys.onEscapePressed: presionesEspacio = 0

        Keys.onPressed: (event) => {
            if (event.key === Qt.Key_A) {
                presionesEspacio += 10
            }
            else if (event.key === Qt.Key_R) {
                rotation += 10
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: texto.focus = true
        }
    }

    Rectangle {
        id: textInputRect
        color: "white"
        width: parent.width * 0.8
        height: 20

        x: (parent.width - width) / 2
        y: imagenHombrecito.y + imagenHombrecito.height + 20

        TextInput {
            id: textInput
            text: "Escriba su texto aqui"

            anchors.fill: parent
            horizontalAlignment: TextInput.AlignHCenter

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    textInput.text = ""
                    textInput.focus = true
                }
            }

            Keys.onPressed: (event) => {
                                if ((event.key === Qt.Key_Enter) || (event.key === Qt.Key_Return)) {
                                    textoDentroDeRectanguloGris.text = textInput.text;
                                }
                            }
        }
    }

    Button {
        x: (parent.width - width) / 2
        y: textInputRect.y + textInputRect.height + 30

        textoMostrado: "Haz click"
        colorBoton: "#660033"

        width: 500
        height: 300

        onClicked: textoDentroDeRectanguloGris.text = "Boton presionado."
    }
}
