const mysql = require('mysql');
const config = require("../config/config.json");

//conectarnos a nuestra DB
var connection = mysql.createConnection(config.database);

connection.connect((err) => {
    if (err) {
        console.log(err);
    } else {
        console.log("DB Conectada correctamente (sedes)");
    }
});
//fin de conexion db

var sedeDB= {};


sedeDB.getAll = function (funCallback) {
    connection.query("SELECT * FROM sedes WHERE estado >=1", function (err, result, fields) {
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

sedeDB.getByIdsede = function (idsede, funCallback) {
    connection.query("SELECT * FROM sedes WHERE idsede=?", idsede, function (err, result, fields) {
        if (err) {
            funCallback({
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            if(result.length>0){
                funCallback(undefined, result[0]);
            }else{
                funCallback({
                    message: "No se encontro la sede"
                });
            }
            
        }
    });
}

sedeDB.create = function (sede, funCallback) {
    var query = 'INSERT INTO sedes (idsede, nombre, dirección, localidad, cod_postal, telcontacto1, telcontacto2, estado) VALUES (?,?,?,?,?,?,?,?)'
    var dbParams = [sede.idsede, sede.nombre, sede.dirección, sede.localidad, sede.cod_postal, sede.telcontacto1, sede.telcontacto2, sede.estado];
    connection.query(query, dbParams, function (err, result, fields) {
        if (err) {
            if(err.code == 'ER_DUP_ENTRY'){
                funCallback({
                    message: `Ya existe la sede con el id ${sede.idsede}`,
                    detail: err
                });
            }else{
                funCallback({
                    message: "Surgio un problema, contactese con un administrador. Gracias",
                    detail: err
                });
            }
            
            console.error(err);
        } else {
            funCallback(undefined, {
                message: `Se creo la sede ${sede.nombre}`,
                detail: result
            });
        }
    });
}

/**
 * 
 * @param {*} idsede
 * @param {*} sede
 * @param {*} funCallback 
 *         retorna:
 *              code = 1 (EXITO)
 *              code = 2 (NOT FOUND) (NO encontro elemento)
 *              code = 3 (ERROR)
 * 
 */
sedeDB.update = function (idsede, sede, funCallback) {
    var query = 'UPDATE sedes SET idsede = ?, nombre = ?, dirección = ?, localidad = ?, cod_postal = ?, telcontacto1 = ?, telcontacto2 = ?, estado = ?'
    var dbParams = [sede.idsede, sede.nombre, sede.dirección, sede.localidad, sede.cod_postal, sede.telcontacto1, sede.telcontacto2, sede.estado, idsede];
    connection.query(query, dbParams, function (err, result, fields) {
        if (err) {
            funCallback({
                code:3,
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            if (result.affectedRows == 0) {
                funCallback({
                    code:2,
                    message: `No se encontro la sede ${idsede}`,
                    detail: result
                });
            } else {
                funCallback({
                    code:1,
                    message: `Se modifico la sede ${idsede}`,
                    detail: result
                });
            }
        }
    });

}

sedeDB.logdelete = function (idsede, funCallback) {
    connection.query("UPDATE sedes SET estado = 0 WHERE idsede = ?",idsede, function (err, result, fields) {
        if (err) {
            funCallback({
                code:3,
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            }); 
            console.error(err);
        } else {
            if (result.affectedRows == 0) {
                funCallback({
                    code:2,
                    message: `No se encontro la sede con ${idsede}`,
                    detail: result
                }); 
            } else {
         //       console.error(err);
                    funCallback({
                    code:1,
                    message: `Se elimmino logicamente la sede ${idsede}`,
                    detail: result
                }); 
            }
        }
    });
}

module.exports =
sedeDB;
