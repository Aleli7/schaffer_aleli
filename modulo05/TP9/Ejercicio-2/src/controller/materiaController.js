require("rootpath")();
const express = require('express');
const app = express();

const materiaDB = require("../datasource/materiaDB.js");


app.get('/', getAll);

app.get('/:idmateria', getByIdmateria);

app.post('/', create);

app.put('/:idmateria', update);

app.delete('/:idmateria', eliminacion);

// Metododo para listar todas las materias
function getAll(req, res) {
    materiaDB.getAll(function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para buscar materias por su id
function getByIdmateria(req, res) {
    materiaDB.getByIdmateria(req.params.idmateria,function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para agregar materias
function create(req, res) {
    materiaDB.create(req.body, function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para modificar materias
function update(req, res) {
    materiaDB.update(req.params.idmateria, req.body, function (result) {
        if (result.code == 3) {
            res.status(500).send(err);
        } else if (result.code == 2) {
            res.status(404).json(result);
        } else {
            res.json(result);
        }
    });
}

// Metodo par eliminar personas cambiando el estado a 0
function eliminacion(req, res) {
    materiaDB.logdelete(req.params.idmateria, function (result) {
        if (result.code == 3) {
            res.status(500).send(err);
        } else if (result.code == 2) {
                res.status(404).json(result);  
        } else if (result.code == 1) {      
            res.json(result);
        }
    });
}

module.exports = app;