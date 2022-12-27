import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    StackView {
        id: stackView

        initialItem: primeraPagina

        anchors.fill: parent
    }

    Component {
        id: primeraPagina

        Rectangle{
            Text {
                id: texto1

                text: "Esta es la primera pagina"
            }

            Button {
                id: boton1

                anchors.centerIn: parent

                text: "Siguiente pagina"

                onClicked: {
                    stackView.push(segundaPagina);
                }
            }
        }
    }

    Component {
        id: segundaPagina

        Rectangle {
            Text {
                id: texto2
                text: "Esta es la segunda pagina"
            }

            Button {
                id: boton2

                anchors.centerIn: parent

                text: "Pagina Anterior"

                onClicked: {
                    stackView.pop();
                }
            }

            Button {
                id: boton3

                anchors.top: boton2.bottom

                text: "Pagina Siguiente"

                onClicked: {
                    stackView.push(terceraPagina);
                }
            }
        }
    }

    Component {
        id: terceraPagina

        Rectangle {
            Text {
                id: texto3
                text: "Esta es la tercera pagina"
            }

            Button {
                id: boton4

                anchors.centerIn: parent

                text: "Pagina Anterior"

                onClicked: {
                    stackView.pop();
                }
            }
        }
    }
}
