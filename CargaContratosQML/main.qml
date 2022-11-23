import QtQuick
import QtQuick.Window
import QtQuick.Dialogs

import templatehandler.interface

Window {
    width: 640
    height: 480
    visible: true
    title: "Carga Contratos"

    TemplateHandler {
        id: templateHandler
    }

    FileDialog {
        id: loadFileDialog

        onAccepted: {

            var url = loadFileDialog.selectedFile.toString();

            //url = url.replace(/^(file:\/{3})/,"");
            url = url.split("///")[1];

            templateHandler.cargarTemplate(url);

            print(templateHandler.obtenerCampos());
        }
    }

    Component.onCompleted: {
        loadFileDialog.open();
    }
}
