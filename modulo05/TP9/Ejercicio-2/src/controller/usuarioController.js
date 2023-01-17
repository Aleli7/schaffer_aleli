require("rootpath")();
const express = require('express');
const app = express();

const usuarioDB = require("../datasource/usuarioDB.js");


app.get('/', getAll);

app.get('/:idusuario', getByIdusuario);

app.post('/', create);

app.put('/:idusuario', update);

app.delete('/:idusuario', eliminacion);

// Metododo para listar todas los usuarios 
function getAll(req, res) {
    usuarioDB.getAll(function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para buscar usuarios por su id
function getByIdusuario(req, res) {
    usuarioDB.getByIdusuario(req.params.idusuario,function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para agregar usuarios
function create(req, res) {
    usuarioDB.create(req.body, function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para modificar usuarios
function update(req, res) {
    usuarioDB.update(req.params.idusuario, req.body, function (result) {
        if (result.code == 3) {
            res.status(500).send(err);
        } else if (result.code == 2) {
            res.status(404).json(result);
        } else {
            res.json(result);
        }
    });
}

// Metodo par eliminar usuarios cambiando el estado a 0
function eliminacion(req, res) {
    usuarioDB.logdelete(req.params.idusuario, function (result) {
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