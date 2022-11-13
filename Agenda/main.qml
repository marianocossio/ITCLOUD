import QtQuick
import QtQuick.Window

import "https://gist.githubusercontent.com/marianocossio/3566cc0346678383335594dd2e0fccc2/raw/506b08a94d9b0e0f449527b6b3cf79963bc67ecb" as BotonExterno

Window {
    width: 640
    height: 480
    visible: true
    title: "Agenda SQL"

    Rectangle {
        id: agenda

        anchors.fill: parent
        anchors.margins: 5
        border.color: "black"
        radius: 5

        color: "#9994AB"


        Text {
            id: nombreLabel

            text: "Nombre"

            height: 20

            anchors.top: parent.top
            anchors.left: parent.left
            verticalAlignment: TextInput.AlignVCenter

            anchors.margins: 5
        }

        Rectangle {

            width: agenda.width
            height: 30

            anchors.top: nombreLabel.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 5
            border.color: "black"
            radius: 5

            TextInput {
                id: nombre

                anchors.fill: parent
                verticalAlignment: TextInput.AlignVCenter

                anchors.leftMargin: 5
            }
        }

        BotonExterno.Boton {
            id: botonBuscar
            texto: "BUSCAR"

            anchors.right: parent.right
            anchors.top: nombre.bottom
            anchors.margins: 5

            onClicked:{
                console.log("Accediendo a la base de datos.");
            }
        }
    }
}
