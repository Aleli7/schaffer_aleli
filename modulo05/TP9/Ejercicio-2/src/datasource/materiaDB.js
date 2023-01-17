const mysql = require('mysql');
const config = require("../config/config.json");

//conectarnos a nuestra DB
var connection = mysql.createConnection(config.database);

connection.connect((err) => {
    if (err) {
        console.log(err);
    } else {
        console.log("DB Conectada correctamente (materias)");
    }
});
//fin de conexion db

var materiaDB= {};

 materiaDB.getAll = function (funCallback) {
    connection.query("SELECT * FROM materias WHERE estado >=1", function (err, result, fields) {
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

materiaDB.getByIdmateria = function (idmateria,funCallback) {
    connection.query("SELECT * FROM materias WHERE idmateria=?",idmateria, function (err, result, fields) {
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
                    message: "No se encontro la materia buscada"
                });
            }
            
        }
    });
}

materiaDB.create = function (materia, funCallback) {
    var query = 'INSERT INTO materias (idmateria, nombre, objetivo, plan_estudio, estado) VALUES (?,?,?,?,?)'
    var dbParams = [materia.idmateria, materia.nombre, materia.objetivo, materia.plan_estudio, materia.estado];
    connection.query(query, dbParams, function (err, result, fields) {
        if (err) {
            if(err.code == 'ER_DUP_ENTRY'){
                funCallback({
                    message: `Ya existe la materia con el id ${materia.idmateria}`,
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
                message: `Se creo la materia ${materia.nombre}`,
                detail: result
            });
        }
    });
}

/**
 * 
 * @param {*} idmateria
 * @param {*} materia
 * @param {*} funCallback 
 *         retorna:
 *              code = 1 (EXITO)
 *              code = 2 (NOT FOUND) (NO encontro elemento)
 *              code = 3 (ERROR)
 * 
 */
materiaDB.update = function (idmateria, materia, funCallback) {
    var query =  'UPDATE materias SET idmateria = ?, nombre = ?, objetivo = ?, plan_estudio = ? estado = ? WHERE idmateria = ?'
    var dbParams = [materia.idmateria, materia.nombre, materia.objetivo, materia.plan_estudio, materia.estado, idmateria];
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
                    message: `No se encontro el usuario ${idmateria}`,
                    detail: result
                });
            } else {
                funCallback({
                    code: 1,
                    message: `Se modifico el usuario ${materia.nombre}`,
                    detail: result
                });
            }
        }
    });

}

materiaDB.logdelete = function (idmateria, funCallback) {
    connection.query("UPDATE materias SET estado = 0 WHERE idmateria = ?",idmateria, function (err, result, fields) {
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
                    message: `La materia con id ${idmateria} no existe`,
                    detail: result
                }); 
            } else {
         //       console.error(err);
                    funCallback({
                    code:1,
                    message: `Se elimino logicamente la materia con el id ${idmateria}`,
                    detail: result
                }); 
            }
        }
    });
}

module.exports =
materiaDB;
