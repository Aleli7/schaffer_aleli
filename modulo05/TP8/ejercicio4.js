const fs = require('fs');
const rawdata = fs.readFileSync('./modulo05/TP7/Ejercicio-1/personas.json', 'utf8');
var persona = JSON.parse(rawdata);

function getNombre(datos) {
    for (var i = 0; i < datos['Personas'].length; i++) {
        let AlmacenRecorrido = datos['Personas'] [ i ] ['Localidad'];
        if (datos['Personas'] [ i ] ['Localidad'] === 'Posadas') {
            console.log(datos['Personas'] [ i ] ['Nombre'] + '  ' + datos['Personas'] [ i ] ['Apellido']);
        }
    }
}
getNombre(persona);
