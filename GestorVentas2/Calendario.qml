import QtQuick

Item {
    id: contenedorCalendario

    property alias color: rectanguloSeleccionador.color
    //property color color
    property bool monthShown: true
    property var months: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"]
    property int currentMonth
    property int year

    signal fechaSeleccionada(int dia, int mes, int anio)

    Component.onCompleted: {
        var fecha = new Date();

        currentMonth = fecha.getMonth();
        year = fecha.getFullYear();

        populateModel();
    }

    Rectangle {
        id: rectanguloSeleccionador

        //anchors.fill: parent
        //color: parent.color

        width: parent.width
        height: parent.height / 8

        Rectangle {
            id: rectangleTextMonthYear

            height: parent.height
            anchors.left: decrementarMes.right
            anchors.right: incrementarMes.left

            color: parent.color

            Text {
                id: textMonthYear
                text: monthShown ? months[currentMonth] : year

                anchors.centerIn: parent

                color: Qt.darker(rectanguloSeleccionador.color)

                font.pixelSize: rectanguloSeleccionador.height / 2
            }

            Text {
                id: textYearMonth

                text: monthShown ? year : months[currentMonth]

                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.margins: parent.width / 30

                color: Qt.darker(parent.color)

                font.pixelSize: parent.height / 4
            }

            MouseArea {
                id: mouseAreaMonthYear

                anchors.fill: parent

                onClicked: {
                    monthShown = !monthShown;
                }
            }
        }

        Boton {
            id: incrementarMes

            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: rectanguloSeleccionador.width / 100

            texto: ">"

            radius: height / 2

            height: parent.height * 0.8
            width: parent.width / 6

            color: Qt.darker(rectanguloSeleccionador.color)

            tamTexto: height / 2
            colorTexto: contenedorCalendario.color

            onClicked: {
                if (monthShown) {
                    if (currentMonth < 11) {
                        currentMonth++;
                    }
                    else {
                        year++;
                        currentMonth = 0;
                    }
                }

                else {
                    year++;
                }

                populateModel();
            }
        }

        Boton {
            id: decrementarMes

            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: rectanguloSeleccionador.width / 100

            texto: "<"

            radius: height / 2

            height: parent.height * 0.8
            width: parent.width / 6

            color: Qt.darker(rectanguloSeleccionador.color)

            tamTexto: height / 2
            colorTexto: contenedorCalendario.color

            onClicked: {
                if (monthShown) {
                    if (currentMonth > 0) {
                        currentMonth--;
                    }
                    else {
                        currentMonth = 11;
                        year--;
                    }
                }

                else {
                    year--;
                }

                populateModel();
            }
        }
    }

    Rectangle {
        id: rectanguloCalendario

        color: rectanguloSeleccionador.color

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: rectanguloSeleccionador.bottom
        anchors.bottom: parent.bottom

        GridView {
            id: vistaCalendario

            anchors.fill: parent

            //model: 42

            cellWidth: Math.round(rectanguloCalendario.width / 7)
            cellHeight: Math.round(rectanguloCalendario.height / 6)

            delegate: Rectangle {
                id: rectanguloDelegado

                width: vistaCalendario.cellWidth
                height: vistaCalendario.cellHeight

                color: rectanguloSeleccionador.color

                required property int modelData
                required property int index

                Rectangle {
                    id: rectanguloInternoDelegado

                    anchors.fill: parent
                    anchors.margins: calendario.width / 200

                    radius: calendario.width / 100

                    color: Qt.darker(parent.color, 1.1)

                    Text {
                        id: fechaDelegado
                        text:  rectanguloDelegado.modelData
                        color: {
                            if (((rectanguloDelegado.index < 7) && (rectanguloDelegado.modelData > 15)) || ((rectanguloDelegado.index > 26) && (rectanguloDelegado.modelData < 15))) {
                                return Qt.darker(contenedorCalendario.color, 1.5);
                            }
                            else {
                                return Qt.darker(contenedorCalendario.color, 4);
                            }
                        }

                        anchors.centerIn: parent

                        font.pixelSize: rectanguloInternoDelegado.height / 3
                    }

                    MouseArea {
                        id: mouseAreaRectanguloInternoDelegado

                        anchors.fill: parent

                        onClicked: {
                            //print(modelData + "/" + (currentMonth + 1) + "/" + year);
                            if (rectanguloDelegado.modelData > 15 && rectanguloDelegado.index < 6) {
                                calendario.fechaSeleccionada(rectanguloDelegado.modelData, contenedorCalendario.currentMonth, contenedorCalendario.year);
                            }
                            else if (rectanguloDelegado.modelData < 15 && rectanguloDelegado.index > 27) {
                                calendario.fechaSeleccionada(rectanguloDelegado.modelData, contenedorCalendario.currentMonth + 2, contenedorCalendario.year)
                            }
                            else {
                                calendario.fechaSeleccionada(rectanguloDelegado.modelData, contenedorCalendario.currentMonth + 1, contenedorCalendario.year);
                            }
                        }
                    }
                }
            }
        }
    }

    function populateModel() {
        var modeloLocal = [];

        var fechaLocal = new Date(year, currentMonth, 1);

        fechaLocal.setDate(1);

        if (fechaLocal.getDay() > 1) {
            fechaLocal.setTime(fechaLocal.getTime() - 24 * 3600 * 1000 * (fechaLocal.getDay() - 1));
        }
        else if (fechaLocal.getDay() < 1) {
            fechaLocal.setTime(fechaLocal.getTime() - 24 * 3600 * 1000 * 6);
        }

        for (var i = 0; i < 42; i++) {
            modeloLocal.push(fechaLocal.getDate());

            fechaLocal.setTime(fechaLocal.getTime() + 24 * 3600000);
        }

        vistaCalendario.model = modeloLocal;
    }
}
