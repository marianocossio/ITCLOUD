import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        width: 100
        height: 100
        color: "red"
        border.color: "black"
        border.width: 5
        radius: 50
    }

}
