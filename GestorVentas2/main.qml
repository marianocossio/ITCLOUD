import QtQuick
import QtQuick.Controls
import QtQuick.LocalStorage
import QtQuick.Dialogs
import QtQuick.Shapes

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

                    nextTab: passwordInputField.inputItem
                    prevTab: this
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

                    //nextTab: inputItem
                    prevTab: nameInputField.inputItem
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

                Image {
                    id: nuevoUsuarioImage

                    height: parent.height - nuevoUsuarioImageLabel.height - 10

                    anchors.top: nuevoUsuarioImageLabel.bottom
                    anchors.horizontalCenter: parent.horizontalCenter

                    fillMode: Image.PreserveAspectFit

                    source: "defaultProfile.jpg"

                    MouseArea {
                        id: nuevoUsuarioImageMouseArea

                        anchors.fill: parent

                        onClicked: {
                            fileDialog.open();
                        }
                    }
                }

                Shape {
                    id: shape

                    height: nuevoUsuarioImage.height
                    width: height * 2

                    anchors.centerIn: nuevoUsuarioImage

                    ShapePath {
                        id: semiMarcoSuperior

                        startX: 0
                        startY: shape.height / 2

                        strokeColor: nuevoUsuarioNameInputField.color
                        strokeWidth: 0
                        fillColor: nuevoUsuarioNameInputField.color

                        PathLine {
                            x: shape.width / 4
                            y: shape.height / 2
                        }

                        PathArc {
                            x: shape.width * 0.75
                            y: shape.height / 2

                            radiusX: shape.width / 4
                            radiusY: shape.height / 2

                            direction: PathArc.Clockwise
                        }

                        PathLine {
                            x: shape.width
                            y: shape.height / 2
                        }

                        PathLine {
                            x: shape.width
                            y: 0
                        }

                        PathLine {
                            x: 0
                            y: 0
                        }

                        PathLine {
                            x: 0
                            y: shape.height / 2
                        }
                    }

                    ShapePath {
                        id: semiMarcoInferior

                        startX: 0
                        startY: shape.height / 2

                        strokeColor: nuevoUsuarioNameInputField.color
                        strokeWidth: 0
                        fillColor: nuevoUsuarioNameInputField.color

                        PathLine {
                            x: shape.width / 4
                            y: shape.height / 2
                        }

                        PathArc {
                            x: shape.width * 0.75
                            y: shape.height / 2

                            radiusX: shape.width / 4
                            radiusY: shape.height / 2

                            direction: PathArc.Counterclockwise
                        }

                        PathLine {
                            x: shape.width
                            y: shape.height / 2
                        }

                        PathLine {
                            x: shape.width
                            y: shape.height
                        }

                        PathLine {
                            x: 0
                            y: shape.height
                        }

                        PathLine {
                            x: 0
                            y: shape.height / 2
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


                // load products
                if (!db) {
                    return;
                }

                db.transaction( function(transaccion) {
                    var resultado = transaccion.executeSql("SELECT * FROM products");

                    for (var i = 0; i < resultado.rows.length; i++) {
                        model.append({ text: resultado.rows[i].product })
                    }
                }
                )

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

                    source: "defaultProfile.jpg"
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

            ComboBox {
                id: productsComboBox
                width: 200
                height: 50

                font.pixelSize: 20

                model: ListModel {
                    id: model
                }

                anchors.right: parent.horizontalCenter
                anchors.rightMargin: 5
                anchors.top: parent.top
                anchors.topMargin: 20
            }

            SpinBox {
                id: productsSpinBox

                value: 1

                width: 100
                height: 50

                font.pixelSize: 20

                anchors.left: parent.horizontalCenter
                anchors.leftMargin: 5
                anchors.top: parent.top
                anchors.topMargin: 20
            }

            Boton {
                id: vender

                texto: "VENDER"

                anchors.centerIn: parent

                onClicked: {
                    if (!db) {
                        return;
                    }

                    db.transaction( function(transaccion) {
                        var resultado = transaccion.executeSql("SELECT * FROM products WHERE product = '" + productsComboBox.displayText + "'");

                        if (resultado.rows.length === 1) {
                            var producto = resultado.rows[0];
                        }
                        else {
                            print("No se leyo producto.");
                            return;
                        }

                        transaccion.executeSql("INSERT INTO sales VALUES (?,?,?)", [mainWindow.userName, (producto.price * productsSpinBox.value), Date.now()]);
                    }
                    );
                }
            }
        }
    }

    function initializeDB() {
        db = LocalStorage.openDatabaseSync("DB.sql", "1.0", "Base de datos de usuarios, productos y ventas.", 20000);

        db.transaction( function(transaccion) {
            console.log("Inicializando tablas.");

            transaccion.executeSql("CREATE TABLE IF NOT EXISTS users(user TEXT, password TEXT, photo TEXT)");
            transaccion.executeSql("CREATE TABLE IF NOT EXISTS products(product TEXT, price FLOAT)");
            transaccion.executeSql("CREATE TABLE IF NOT EXISTS sales(user TEXT, sale FLOAT, date DATE)");
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
