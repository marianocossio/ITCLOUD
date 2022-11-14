import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    id: ventana
    width: 640
    height: 480
    visible: true
    title: "Agenda SQL"

    color: "#9994AB"

    CampoInput {
        id: nombre

        width: parent.width

        label: "Nombre"

        color: Qt.lighter(ventana.color)
    }

    Boton {
        id: botonBuscar
        texto: "BUSCAR"

        anchors.right: parent.right
        anchors.top: nombre.bottom
        anchors.margins: 5

        color: "#94ABA4"

        onClicked:{
            console.log("Accediendo a la base de datos.");

            dialogoCalendario.open();
        }
    }

    Dialog {
        id: dialogoCalendario

        width: 300
        height: 300

        anchors.centerIn: parent

        background: Rectangle {
            color: "#94ABA4"

            radius: 5
        }

        Calendario {
            id: calendario

            color: "#94ABA4"

            anchors.fill: parent

            onFechaSeleccionada: (dia, mes, anio) => {
                                     print(dia + "/" + mes + "/" + anio);
                                     dialogoCalendario.close();
            }
        }
    }
}
