import QtQuick
import QtQuick.Controls
import QtQuick.LocalStorage
import QtQuick.Dialogs

Window {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: "Gestor Ventas"

    property var db
    property var userName

    Component.onCompleted: {
        initializeDB();
    }

    Dialog {
        id: mensajero

        title: ""

        anchors.centerIn: parent

        Label {
            id: mensaje

            text: ""
        }

        standardButtons: Dialog.Ok
    }

    StackView {
        id: stack
        initialItem: inicio
        anchors.fill: parent
    }

    Component {
        id: inicio

        Rectangle {
            Rectangle {
                id: nameInput

                width: parent.width
                height: 70

                CampoInput{
                    id: nameInputField

                    label: "Nombre"

                    anchors.fill: parent
                    anchors.margins: 5

                    horizontalAlignment: TextInput.AlignHCenter
                }
            }

            Rectangle {
                id: passwordInput

                width: parent.width
                height: 70

                anchors.top: nameInput.bottom

                CampoInput {
                    id: passwordInputField

                    label: "Contraseña"

                    anchors.fill: parent
                    anchors.margins: 5

                    echoMode: TextInput.Password

                    horizontalAlignment: TextInput.AlignHCenter
                }
            }

            Rectangle {
                id: newUserButtonRect

                height: 50
                width: parent.width / 2

                anchors.top: passwordInput.bottom
                anchors.left: parent.left

                Boton {
                    id: newUserButton

                    texto: "NUEVO USUARIO"

                    anchors.fill: parent

                    anchors.margins: 5

                    onClicked: {
                        stack.push(nuevoUsuario);
                    }
                }
            }

            Rectangle {
                id: loginButtonRect

                height: 50
                width: parent.width / 2

                anchors.top: passwordInput.bottom
                anchors.right: parent.right

                Boton {
                    id: loginButton

                    texto: "INGRESAR"

                    anchors.fill: parent

                    anchors.margins: 5

                    onClicked: {
                        var loginAttempt = logIn(nameInputField.input, passwordInputField.input);

                        switch (loginAttempt) {
                        case -2:
                            mensaje.text = "DB inexistente."
                            mensajero.open();
                            break;
                        case -1:
                            mensaje.text = "Usuario inexistente."
                            mensajero.open();
                            break;
                        case 0:
                            mensaje.text = "Contraseña incorrecta."
                            mensajero.open();
                            break;
                        case 1:
                            mainWindow.userName = nameInputField.input;
                            stack.push(gestionVentas)
                        }
                    }
                }
            }
        }
    }

    Component {
        id: nuevoUsuario

        Rectangle {
            Rectangle {
                id: nuevoUsuarioNameInput

                width: parent.width
                height: 70

                CampoInput{
                    id: nuevoUsuarioNameInputField

                    label: "Nombre"

                    anchors.fill: parent
                    anchors.margins: 5

                    horizontalAlignment: TextInput.AlignHCenter
                }
            }

            Rectangle {
                id: nuevoUsuarioPasswordInput

                width: parent.width
                height: 70

                anchors.top: nuevoUsuarioNameInput.bottom

                CampoInput {
                    id: nuevoUsuarioPasswordInputField

                    label: "Contraseña"

                    anchors.fill: parent
                    anchors.margins: 5

                    echoMode: TextInput.Password

                    horizontalAlignment: TextInput.AlignHCenter
                }
            }

            Rectangle {
                id: nuevoUsuarioRepeatPasswordInput

                width: parent.width
                height: 70

                anchors.top: nuevoUsuarioPasswordInput.bottom

                CampoInput {
                    id: nuevoUsuarioRepeatPasswordInputField

                    label: "Repita la contraseña"

                    anchors.fill: parent
                    anchors.margins: 5

                    echoMode: TextInput.Password

                    horizontalAlignment: TextInput.AlignHCenter
                }
            }

            Rectangle {
                id: nuevoUsuarioImageRect

                height: parent.height / 4

                radius: nuevoUsuarioNameInputField.radius
                color: nuevoUsuarioNameInputField.color

                anchors.top: nuevoUsuarioRepeatPasswordInput.bottom
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.margins: 5

                Label {
                    id: nuevoUsuarioImageLabel

                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.margins: 5

                    text: "Avatar"
                }

                /*Image {
                    id: nuevoUsuarioImage

                    height: parent.height - nuevoUsuarioImageLabel.height - 10

                    anchors.top: nuevoUsuarioImageLabel.bottom
                    anchors.horizontalCenter: parent.horizontalCenter

                    fillMode: Image.PreserveAspectFit

                    source: "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"

                    MouseArea {
                        id: nuevoUsuarioImageMouseArea

                        anchors.fill: parent

                        onClicked: {
                            fileDialog.open();
                        }
                    }
                }*/

                Canvas {
                    id: nuevoUsuarioImage

                    property string source: "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"

                    height: parent.height - nuevoUsuarioImageLabel.height - 10

                    anchors.top: nuevoUsuarioImageLabel.bottom
                    anchors.horizontalCenter: parent.horizontalCenter

                    onPaint: {
                        var ctx = getContext("2d");

                        ctx.strokeStyle = '#ff2a68';
                        ctx.beginPath();
                        ctx.moveTo(110,10);
                        ctx.lineTo(155,10);
                        ctx.lineTo(135,55);
                        ctx.closePath();
                        ctx.clip();
                        ctx.drawImage(source, 100, 10);
                        ctx.stroke();
                    }

                    MouseArea {
                        id: nuevoUsuarioImageMouseArea

                        anchors.fill: parent

                        onClicked: {
                            fileDialog.open();
                        }
                    }
                }
            }

            Rectangle {
                id: nuevoUsuarioCancelButtonRect

                height: 50
                width: parent.width / 2

                anchors.bottom: parent.bottom
                anchors.left: parent.left

                Boton {
                    id: nuevoUsuarioCancelButton

                    texto: "CANCELAR"

                    anchors.fill: parent

                    anchors.margins: 5

                    onClicked: {
                        stack.pop();
                    }
                }
            }

            Rectangle {
                id: nuevoUsuarioAcceptButtonRect

                height: 50
                width: parent.width / 2

                anchors.bottom: parent.bottom
                anchors.right: parent.right

                Boton {
                    id: nuevoUsuarioAcceptButton

                    texto: "ACEPTAR"

                    anchors.fill: parent

                    anchors.margins: 5

                    onClicked: {
                        if (nuevoUsuarioPasswordInputField.input !== nuevoUsuarioRepeatPasswordInputField.input) {
                            mensaje.text = "Las contraseñas no coinciden.";
                            mensajero.open();
                        }

                        else {
                            var newUserAttempt = newUser(nuevoUsuarioNameInputField.input, nuevoUsuarioPasswordInputField.input, nuevoUsuarioNameInputField.input + ".png");

                            switch (newUserAttempt) {
                            case -2:
                                mensaje.text = "DB inexistente."
                                mensajero.open();
                                break;
                            case -1:
                                mensaje.text = "El usuario ya existe."
                                mensajero.open();
                                break;
                            case 1:
                                nuevoUsuarioImage.grabToImage(
                                            (result) => {
                                                result.saveToFile(nuevoUsuarioNameInputField.input + ".png");
                                            }
                                            )
                                mensaje.text = "Usuario creado correctamente."
                                mensajero.open();
                                stack.pop();
                                break;
                            }
                        }
                    }
                }
            }

            FileDialog {
                id: fileDialog

                title: "Abrir Imagen"

                fileMode: FileDialog.OpenFile
                //currentFolder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]

                onAccepted: {
                    nuevoUsuarioImage.source = selectedFile;
                }
            }
        }
    }

    Component {
        id: gestionVentas

        Rectangle {
            Component.onCompleted: {
                userImage.source = "image://imageProvider/" + getPhoto(mainWindow.userName);
            }

            Drawer {
                id: drawer

                width: 0.66 * parent.width
                height: parent.height

                Image {
                    id: userImage

                    height: parent.height / 4
                    width: height

                    fillMode: Image.PreserveAspectFit

                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: parent.height / 20

                    source: "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
                }

                Label {
                    id: userNameLabel

                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: userImage.bottom
                    anchors.topMargin: parent.height / 20

                    text: mainWindow.userName
                }

                Boton {
                    id: changePasswordButton

                    texto: "CAMBIAR CONTRASEÑA"

                    width: parent.width * 0.75
                    height: width / 8

                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: logoutButton.top
                    anchors.bottomMargin: parent.height / 60
                }

                Boton {
                    id: logoutButton

                    texto: "SALIR"

                    width: parent.width * 0.75
                    height: width / 8

                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: parent.height / 60
                }
            }
        }
    }

    function initializeDB() {
        db = LocalStorage.openDatabaseSync("users.sql", "1.0", "Base de datos de usuarios.", 20);

        db.transaction( function(transaccion) {
            console.log("Inicializando tabla.");

            transaccion.executeSql("CREATE TABLE IF NOT EXISTS users(user TEXT, password TEXT, photo TEXT)");
        }
        );
    }

    function newUser(user, password, photo) {
        /*
          DB inexistente: -2
          usuario ya existe: -1
          correcto: 1
        */
        var result = -2;

        if (!db) {
            return result;
        }

        db.transaction( function(transaccion) {
            var resultado = transaccion.executeSql("SELECT * from users where user = '" + user + "'");

            if (resultado.rows.length === 1) {
                result = -1;
            }
            else {
                resultado = transaccion.executeSql("INSERT INTO users VALUES (?,?,?)", [user, password, photo]);
                result = 1;
            }
        }
        );

        return result;
    }

    function logIn(user, password) {
        /*
          DB inexistente: -2
          usuario inexistente: -1
          password incorrecto: 0
          correcto: 1
        */
        var result = -2;

        if (!db) {
            return result;
        }

        db.transaction( function(transaccion) {
            var resultado = transaccion.executeSql("SELECT * from users where user = '" + user + "'");

            if (resultado.rows.length === 1) {
                var readPassword = resultado.rows[0].password;

                if (readPassword === password) {
                    result = 1;
                }

                else {
                    result = 0;
                }
            }
            else {
                result = -1;
            }
        }
        );

        return result;
    }

    function getPhoto(user) {
        /*
          DB inexistente: -2
          usuario inexistente: -1
          correcto: URL de la foto
        */
        var result = -2;

        if (!db) {
            return result;
        }

        db.transaction( function(transaccion) {
            var resultado = transaccion.executeSql("SELECT * from users where user = '" + user + "'");

            if (resultado.rows.length === 1) {
                result = resultado.rows[0].photo;
            }
            else {
                result = -1;
            }
        }
        );

        return result;
    }
}
