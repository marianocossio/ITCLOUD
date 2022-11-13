import QtQuick
import QtQuick.Window
import QtQuick.LocalStorage

Window {
    width: 640
    height: 480
    visible: true
    title: "Agenda"

    property var db;

    Rectangle {
        id: cuadrado

        width: 100
        height: 100

        color: "#7455EC"

        radius: 5

        Text {
            id: textoCuadrado

            anchors.centerIn: parent

            text: {
                Math.round(cuadrado.x) + " , " + Math.round(cuadrado.y);
            }

            horizontalAlignment: Text.AlignHCenter

            font.pointSize: 15

            color: Qt.lighter((cuadrado.color))
        }

        MouseArea {
            id: mouseAreaCuadrado

            anchors.fill: parent

            drag.target: parent
        }
    }

    Component.onCompleted: {
        inicializarDB();
        leerPosicion();
    }

    Component.onDestruction: {
        guardarPosicion();
    }

    function inicializarDB() {
        db = LocalStorage.openDatabaseSync("C:\\Users\\maria\\Mariano\\Workspaces\\wITCLOUD\\SQL\\PersistenciaPosicion.sql", "1.0", "Base de datos para guardar la posicion del cuadrado", 20);

        db.transaction( function(transaccion) {
            console.log("Inicializando tabla.");

            transaccion.executeSql("CREATE TABLE IF NOT EXISTS data(name TEXT, value TEXT)");
        }
            );
    }

    function guardarPosicion() {
        console.log("Guardando Posicion");

        if (!db) {
            return;
        }

        db.transaction( function(transaccion) {
            var resultado = transaccion.executeSql("SELECT * from data where name = 'posRect'");

            var objeto = {
                x: cuadrado.x,
                y: cuadrado.y
            };

            //{"x":"125","y":"458"}

            if (resultado.rows.length === 1) {
                console.log("Los datos ya existen. Seran reemplazados.");
                resultado = transaccion.executeSql("UPDATE data set value=? where name='posRect'", [JSON.stringify(objeto)]);
            }
            else {
                console.log("Los datos todavia no existen. Se crea el valor en la tabla.");
                resultado = transaccion.executeSql("INSERT INTO data VALUES (?,?)", ["posRect", JSON.stringify(objeto)]);
            }

        }
            );
    }

    function leerPosicion() {
        console.log("Leyendo la posicion guardada.");

        if (!db) {
            return;
        }

        db.transaction( function (transaccion) {
            console.log("Leyendo datos de la base de datos.");

            var resultado = transaccion.executeSql("SELECT * FROM data where name='posRect'");

            if (resultado.rows.length === 1) {
                var valor = resultado.rows[0].value;

                var objeto = JSON.parse(valor);

                cuadrado.x = objeto.x;
                cuadrado.y = objeto.y;
            }
        }
            );
    }
}
