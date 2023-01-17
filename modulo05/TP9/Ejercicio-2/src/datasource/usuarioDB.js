const mysql = require('mysql');
const config = require("../config/config.json");

//conectarnos a nuestra DB
var connection = mysql.createConnection(config.database);

connection.connect((err) => {
    if (err) {
        console.log(err);
    } else {
        console.log("DB Conectada correctamente (usuarios)");
    }
});
//fin de conexion db

var usuarioDB = {};


usuarioDB.getAll = function (funCallback) {
    connection.query("SELECT * FROM usuarios WHERE estado >=1", function (err, result, fields) {
        if (err) {
            funCallback({
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            funCallback(undefined, result);
        }
    });
}

usuarioDB.getByIdusuario = function (idusuario, funCallback) {
    connection.query("SELECT * FROM  usuarios WHERE idusuario=?", idusuario, function (err, result, fields) {
        if (err) {
            funCallback({
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            if (result.length > 0) {
                funCallback(undefined, result[0]);
            } else {
                funCallback({
                    message: "No se encontro el usuario"
                });
            }

        }
    });
}

usuarioDB.create = function (usuario, funCallback) {
    var query = 'INSERT INTO usuarios (idusuario, nickname , email, password, estado) VALUES (?,?,?,?,?)'
    var dbParams = [usuario.idusuario, usuario.nickname, usuario.email, usuario.password, usuario.estado];
    connection.query(query, dbParams, function (err, result, fields) {
        if (err) {
            if (err.code == 'ER_DUP_ENTRY') {
                funCallback({
                    message: `Ya existe el usuario con el id ${usuario.idusuario}`,
                    detail: err
                });
            } else {
                funCallback({
                    message: "Surgio un problema, contactese con un administrador. Gracias",
                    detail: err
                });
            }

            console.error(err);
        } else {
            funCallback(undefined, {
                message: `Se creo el usuario ${usuario.nickname}`,
                detail: result
            });
        }
    });
}

/**
 * 
 * @param {*} idusuario
 * @param {*} usuario
 * @param {*} funCallback 
 *         retorna:
 *              code = 1 (EXITO)
 *              code = 2 (NOT FOUND) (NO encontro elemento)
 *              code = 3 (ERROR)
 * 
 */
usuarioDB.update = function (idusuario, usuario, funCallback) {
    var query = 'UPDATE usuarios SET idusuario = ?, nickname = ? , email = ?, password = ?, estado = ? WHERE idusuario = ?'
    var dbParams = [usuario.idusuario, usuario.nickname, usuario.email, usuario.password, usuario.estado, idusuario];
    connection.query(query, dbParams, function (err, result, fields) {
        if (err) {
            funCallback({
                code: 3,
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            if (result.affectedRows == 0) {
                funCallback({
                    code: 2,
                    message: `No se encontro el usuario ${idusuario}`,
                    detail: result
                });
            } else {
                funCallback({
                    code: 1,
                    message: `Se modifico el usuario ${usuario.nickname}`,
                    detail: result
                });
            }
        }
    });

}
usuarioDB.logdelete = function (idusuario, funCallback) {
    connection.query("UPDATE usuarios SET estado = 0 WHERE idusuario = ?", idusuario, function (err, result, fields) {
        if (err) {
            funCallback({
                code: 3,
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            if (result.affectedRows == 0) {
                funCallback({
                    code: 2,
                    message: `No se encontro el usuario con id ${idusuario} `,
                    detail: result
                });
            } else {
                //       console.error(err);
                funCallback({
                    code: 1,
                    message: `Se modifico el usuario con el id ${idusuario}`,
                    detail: result
                });
            }
        }
    });
}

module.exports =
    usuarioDB;
