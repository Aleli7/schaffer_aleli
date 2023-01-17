require("rootpath")();
const express = require('express');
const app = express();

const cursoDB = require("../datasource/cursoDB.js");


app.get('/', getAll);

app.get('/:idcurso', getByIdcurso);

app.post('/', create);

app.put('/:idcurso', update);

app.delete('/:idcurso', eliminar);

// Metodo para listar todos los cursos
function getAll(req, res) {
    cursoDB.getAll(function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para buscar cursos por su id
function getByIdcurso(req, res) {
    cursoDB.getByIdcurso(req.params.idcurso,function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para crear cursos
function create(req, res) {
    cursoDB.create(req.body, function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para modificar cursos
function update(req, res) {
    cursoDB.update(req.params.idcurso, req.body, function (result) {
        if (result.code == 3) {
            res.status(500).send(err);
        } else if (result.code == 2) {
            res.status(404).json(result);
        } else {
            res.json(result);
        }
    });
}

// Metodo para eliminar cursos logicamente cambiando el estado a 0
function eliminar(req, res) {
    cursoDB.logdelete(req.params.idcurso, function (result) {
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