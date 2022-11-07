import QtQuick
import QtQuick.Window
import Qt.labs.folderlistmodel
import itcloud.claseprueba

Window {
    width: 640
    height: 480
    visible: true
    title: "Memerizador"

    id: ventana

    /*Image {
        id: primerMeme

        source: "image://provisorDeImagenes/img/ansiedark.jpg"

        anchors.fill: parent
    }*/

    /*Column {
        spacing: 5

        Repeater {
            model: 100

            delegate: Rectangle {
                id: delegado

                required property int index

                width: 50
                height: 20

                color: "lightblue"

                border.color: Qt.darker(color)
                border.width: 2

                Text {
                    id: textoDelegado

                    anchors.centerIn: parent

                    text: parent.index
                }
            }
        }
    }*/

    /*Column {
        spacing: 5

        Repeater {
            model: ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado", "Domingo"]

            delegate: Rectangle {
                id: delegado

                required property int index
                required property var modelData


                width: 100
                height: 50

                color: "lightblue"

                border.color: Qt.darker(color)
                border.width: 2

                Text {
                    id: textoDelegado

                    anchors.centerIn: parent

                    text: index + " " + modelData
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        console.log(index + " " + modelData);
                    }
                }
            }
        }
    }*/

    /*Column {
        spacing: 5

        Repeater {
            model: ListModel {
                id: lista

                ListElement {
                    nombre: "Lunes"
                    colorElemento: "yellow"
                }

                ListElement {
                    nombre: "Martes"
                    colorElemento: "lightblue"
                }

                ListElement {
                    nombre: "Miercoles"
                    colorElemento: "lightgreen"
                }

                ListElement {
                    nombre: "Jueves"
                    colorElemento: "steelblue"
                }

                ListElement {
                    nombre: "Viernes"
                    colorElemento: "pink"
                }

                ListElement {
                    nombre: "Sabado"
                    colorElemento: "#A877B5"
                }

                ListElement {
                    nombre: "Domingo"
                    colorElemento: "#A6CC5B"
                }
            }

            delegate: Rectangle {
                id: delegado

                required property var colorElemento
                required property var nombre
                required property var index

                width: 100
                height: 50

                color: colorElemento
                border.color: Qt.darker(color)
                border.width: 2

                Text {
                    id: textoElemento
                    anchors.centerIn: parent

                    text: delegado.nombre
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        console.log(delegado.index)
                    }
                }
            }
        }
    }*/

    /*ListView {
        anchors.fill: parent
        anchors.margins: 20

        spacing: 5

        model: 100

        clip: true

        delegate: Rectangle {
            id: delegado
            required property int index

            width: 100
            height: 50

            color: "lightblue"

            border.color: Qt.darker(color)
            border.width: 2

            Text {
                id: textoDelegado

                anchors.centerIn: parent

                text: delegado.index
            }
        }
    }*/

    /*ListView {
        id: lista

        anchors.fill: parent
        anchors.margins: 20

        spacing: 5

        model: 100

        clip: true

        delegate: delegado
        highlight: resaltado

        focus: true

        highlightFollowsCurrentItem: false

        Component {
            id: delegado

            Item {
                id: itemDelegado

                width: lista.width
                height: 50

                required property int index

                Rectangle {

                    width: 100
                    height: parent.height

                    anchors.centerIn: parent

                    color: "lightblue"

                    border.color: Qt.darker(color)
                    border.width: 2

                    Text {
                        id: textoDelegado

                        anchors.centerIn: parent

                        text: itemDelegado.index
                    }
                }

                MouseArea {
                    id: mouseAreaDelegado

                    anchors.fill: parent

                    onClicked: {
                        lista.currentIndex = itemDelegado.index;
                    }
                }
            }
        }

        Component {
            id: resaltado

            Rectangle {
                width: lista.width
                height: 50

                color: "lightgreen"

                y: lista.currentItem.y

                Behavior on y {
                    SpringAnimation {
                        spring: 3
                        damping: 0.2
                    }
                }
            }
        }
    }*/

    /*ListView {
            id: lista

            anchors.fill: parent
            anchors.margins: 20

            spacing: 5

            model: ListModel {
                ListElement {
                    nombre: "Lunes"
                    colorElemento: "lightblue"
                }
                ListElement {
                    nombre: "Martes"
                    colorElemento: "pink"
                }
                ListElement {
                    nombre: "Miercoles"
                    colorElemento: "yellow"
                }
                ListElement {
                    nombre: "Jueves"
                    colorElemento: "orange"
                }
                ListElement {
                    nombre: "Viernes"
                    colorElemento: "steelblue"
                }
                ListElement {
                    nombre: "Sabado"
                    colorElemento: "lightgreen"
                }
                ListElement {
                    nombre: "Domingo"
                    colorElemento: "darkgreen"
                }
            }

            clip: true

            delegate: delegado
            highlight: resaltado

            focus: true

            highlightFollowsCurrentItem: false

            Component {
                id: delegado

                Item {
                    id: itemDelegado

                    width: lista.width
                    height: 50

                    required property int index
                    required property var nombre
                    required property var colorElemento

                    Rectangle {

                        width: 100
                        height: parent.height

                        anchors.centerIn: parent

                        color: itemDelegado.colorElemento

                        border.color: Qt.darker(color)
                        border.width: 2

                        Text {
                            id: textoDelegado

                            anchors.centerIn: parent

                            text: itemDelegado.nombre
                        }
                    }

                    MouseArea {
                        id: mouseAreaDelegado

                        anchors.fill: parent

                        onClicked: {
                            lista.currentIndex = itemDelegado.index;
                        }
                    }
                }
            }

            Component {
                id: resaltado

                Rectangle {
                    width: lista.width
                    height: 50

                    color: "lightgreen"

                    y: lista.currentItem.y

                    Behavior on y {
                        SpringAnimation {
                            spring: 3
                            damping: 0.2
                        }
                    }
                }
            }
        }*/

    ListView {
                id: lista

                anchors.fill: parent
                anchors.margins: 20

                spacing: 5

                model: FolderListModel {
                    id: modelo

                    nameFilters: ["*.jpg", "*.jpeg"]

                    showDirs: false
                }

                clip: true

                delegate: delegado
                highlight: resaltado

                focus: true

                highlightFollowsCurrentItem: false

                Component {
                    id: delegado

                    Item {
                        id: itemDelegado

                        width: lista.width
                        height: ventana.height / 5

                        required property int index
                        required property var fileName

                        Rectangle {

                            width: parent.width / 3
                            height: parent.height

                            anchors.centerIn: parent

                            //color: itemDelegado.colorElemento

                            border.color: Qt.darker(color)
                            border.width: 2

                            /*Text {
                                id: textoDelegado

                                anchors.centerIn: parent

                                text: itemDelegado.fileName
                            }*/

                            Image {
                                id: imagenDelegado
                                source: "image://provisorDeImagenes/" + itemDelegado.fileName

                                anchors.fill: parent
                                anchors.margins: 5

                                fillMode: Image.PreserveAspectFit
                            }
                        }

                        MouseArea {
                            id: mouseAreaDelegado

                            anchors.fill: parent

                            onClicked: {
                                lista.currentIndex = itemDelegado.index;

                                objetoDePrueba.imprimirStringPorConsola(itemDelegado.fileName);

                                parent.state = "expandido"
                            }
                        }

                        states: [
                            State {
                                name: "expandido"
                                PropertyChanges {
                                    target: itemDelegado

                                    height: ventana.height
                                }
                            }
                        ]
                    }
                }

                Component {
                    id: resaltado

                    Rectangle {
                        width: lista.width
                        height: ventana.height / 5

                        color: "lightgreen"

                        y: lista.currentItem.y

                        Behavior on y {
                            SpringAnimation {
                                spring: 3
                                damping: 0.2
                            }
                        }
                    }
                }

                ClaseDePrueba {
                    id: objetoDePrueba
                }
            }
}
