const fs = require('fs');
const rawdata = fs.readFileSync('./departamentos.json', 'utf8');
var dep = JSON.parse(rawdata);

function getData(datos) {
    for (var i = 0; i < datos['departamentos'].length; i++) {
        let datamemory = datos['departamentos'] [ i ] ['departamento'];
        if (datos['departamentos'] [ i ] ['departamento'] === 'Tecnología') {
            console.log(datos['departamentos'] [ i ] ['nombre'] + '  ' + datos['departamentos'] [ i ] ['puesto']);
        }
    }
}
getData(dep);
