import QtQuick 2.15
import QtQuick.Window 2.15
import "https://gist.githubusercontent.com/marianocossio/3566cc0346678383335594dd2e0fccc2/raw/506b08a94d9b0e0f449527b6b3cf79963bc67ecb" as BotonRemoto

Window {
    width: 640
    height: 480
    visible: true
    title: "HTML"

    Rectangle {
        id: marco

        anchors.fill: parent

        /*Image {
            id: imagen
            source: "https://thumbs.dreamstime.com/z/vector-bit-pixel-art-photographer-funny-man-79875589.jpg"

            anchors.fill: parent

            fillMode: Image.PreserveAspectFit
        }*/

        /*Loader {
            id: elementoExterno

            source: "https://gist.githubusercontent.com/marianocossio/66f2b61fa1509f300cfcb275025ddcff/raw/da1a08d7d243d0a1a099a1600d9e653a16ad8669/main.qml"

            anchors.centerIn: parent
        }

        BotonRemoto.Boton {
            id: boton

            texto: "SALIR"

            onClicked: {
                Qt.quit();
            }
        }*/

        ListView {
           id: vista

           anchors.fill: parent

           clip: true

           delegate: Thumbnail {
                width: vista.width
                height: vista.height / 4
                text: modelData.title
                iconSource: modelData.link
           }
        }

        Component.onCompleted: {
            cargar();
        }

        function cargar() {
            var httpRequest = new XMLHttpRequest();

            httpRequest.onreadystatechange = function () {
                if (httpRequest.readyState === httpRequest.HEADERS_RECEIVED) {
                    console.log('Header recibido.');
                }

                else if (httpRequest.readyState === httpRequest.DONE) {
                    var objetoJson = JSON.parse(httpRequest.responseText.toString());

                    vista.model = objetoJson.items;

                    console.log("Pagina cargada");
                }
            }

            httpRequest.open("GET", "https://gist.githubusercontent.com/marianocossio/9ac38eae535b5734811bff1df7922b01/raw/94ad54e689623f3c65cc8e0fc162287642550eaf");

            httpRequest.send();
        }
    }
}
