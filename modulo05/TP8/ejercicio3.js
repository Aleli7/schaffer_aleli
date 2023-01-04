'use strict';
const fs = require('fs');
fs.readFile('personas.json', (err, data) => {
if (err) throw err;
//console.log(JSON.parse(data));
console.log(JSON.stringify(data));
console.log(data);
});
/*
¿Qué sucede cuando utilizamos JSON.stringify?
Primero le pasamos el parámetro "data" que está dentro de la función y fue leído anteriormente con el método fs.readFileSync. 
Luego, esos datos se almacenan en un búfer (como números) y luego con JSON.stringify se transforma en un JSON.
*/
/* 
b) Agregar debajo:
console.log(data);
¿Qué sucede? ¿Por qué?
Al agregar dicha línea de código se va a mostrar en la consola el búfer con los números. Porque es así como se ven los datos al ser leídos
por read.FileSync, es decir, aún no procesados por JSON.parse. Es en este momento donde podemos apreciar el papel elemental que
cumple la función JSON.parse ya que es esta misma la que analiza esos datos numéricos y los transforma en un JSON, algo
mucho más legible a nuestra vista.
*/
