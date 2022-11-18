import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.LocalStorage

Window {
    id: ventana
    width: 640
    height: 480
    visible: true
    title: "Agenda SQL"

    color: "#9994AB"

    property var db

    CampoInput {
        id: nombre

        width: parent.width

        label: "Nombre"

        color: Qt.lighter(ventana.color)
    }

    CampoInput {
        id: telefono

        width: parent.width

        label: "Teléfono"

        color: Qt.lighter(ventana.color)

        anchors.top: nombre.bottom
        anchors.margins: 5
    }

    CampoInput {
        id: birthday

        width: parent.width

        label: "Cumpleaños"

        color: Qt.lighter(ventana.color)

        anchors.top: telefono.bottom
        anchors.margins: 5

        clickeable: false

        onCampoSeleccionado: {
            dialogoCalendario.open();
        }
    }

    CampoInput {
        id: archivoFoto

        width: parent.width

        label: "Archivo Foto"

        color: Qt.lighter(ventana.color)

        anchors.top: birthday.bottom
        anchors.margins: 5
    }

    Boton {
        id: botonBuscar
        texto: "BUSCAR"

        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 5

        color: "#94ABA4"

        onClicked:{
            buscarContacto(nombre.input);
        }
    }

    Boton {
        id: botonGuardar
        texto: "GUARDAR"

        anchors.right: botonBuscar.left
        anchors.bottom: parent.bottom
        anchors.margins: 5

        color: "#94ABA4"

        onClicked:{
            var datos = [nombre.input, telefono.input, birthday.input, archivoFoto.input];
            guardarContacto(datos)
        }
    }

    Image {
        id: foto

        source: archivoFoto.input

        anchors.right: botonGuardar.left
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.top: archivoFoto.bottom

        anchors.margins: 5

        fillMode: Image.PreserveAspectFit
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
                                     birthday.input = ((dia < 10 ? "0" : "") + dia + "/" + (mes < 10 ? "0" : "") + mes + "/" + anio);
                                     dialogoCalendario.close();
            }
        }
    }

    Component.onCompleted: {
        inicializarDB();
    }

    Component.onDestruction: {

    }

    function inicializarDB() {
        db = LocalStorage.openDatabaseSync("agenda.sql", "1.0", "Base de datos de la agenda.", 10000);

        /*db.transaction( function(transaction) {
            console.log("Borrando tabla.");

            print(transaction.executeSql("DROP TABLE agenda;"));
        }
        );*/

        db.transaction( function(transaction) {
            console.log("Creando tabla.");

            transaction.executeSql("CREATE TABLE IF NOT EXISTS agenda(nombre TEXT, telefono TEXT, birthday DATE, foto TEXT);");
            //transaction.executeSql("CREATE TABLE IF NOT EXISTS agenda(nombre TEXT, datos TEXT)");

            //"{'x':'123', 'y':'584'}"
            //"{'nombre':'Mariano', 'birthday':'08/08/1989', 'foto':'https://cdna.artstation.com/p/assets/images/images/002/183/170/large/massimo-di-leo-tizietta2.jpg'}"
        }
            );
    }

    function guardarContacto(arrayDatos) {
        print("Guardando Contacto.");

        if (!db) {
            print("Base de Datos Inexistente.");
            return;
        }

        db.transaction( function(transact) {
            var resultado = transact.executeSql("INSERT INTO agenda VALUES (?, ?, ?, ?);", arrayDatos);
        }
                    );
    }

    function buscarContacto(nombreContacto) {
        print("Buscando Contacto");

        if (!db) {
            print("Base de Datos Inexistente.");
            return;
        }

        db.transaction( function(transact) {
            print("Leyendo DB.");

            var sentencia = "SELECT nombre, telefono, birthday, foto FROM agenda WHERE nombre = '" + nombreContacto + "';";

            var resultado = transact.executeSql(sentencia);

            if (resultado.rows.length >= 1) {
                var contacto = resultado.rows[0];

                nombre.input = contacto.nombre;
                telefono.input = contacto.telefono;
                birthday.input = contacto.birthday;
                archivoFoto.input = contacto.foto;

            }
        }
                    );
    }
}
