const fs = require('fs');
let rawdata = fs.readFileSync('./personas.json');
/* Nota: Dejo comentadas las líneas reemplazadas para poder hacer pruebas y apreciar las diferencias entre ambos métodos.
let persona = JSON.parse(rawdata);
console.log(persona);
*/
console.log(JSON.stringify(rawdata));

/* ¿Qué sucede cuando utilizamos JSON.stringify?  ¿Por qué?
Cuando usamos el método JSON.stringify() los valores u objetos que le pasamos se transforman en una cadena JSON.
Pero, en este caso, le estamos pasando lo leído en la variable "rawdata" y, cuando un archivo json se lee con el método fs.readFileSync,
el mismo se almacena en un búfer como datos hexadecimales sin procesar. Luego lo que hacemos con JSON.stringify es transformar
ese búfer en un JSON y por eso en la consola aparcen números en dicho formato.
*/
/* ¿Qué sucede cuando utilizamos JSON.parse? ¿Por qué?
Cuando usamos JSON.parse() nuestro archivo json se va a mostrar tal cual es, sin cambios. Esto se debe porque este 
método maneja el análisis de los datos sin procesar, los convierte en texto ASCII y parsea los datos JSON, conviertiéndolo en un objeto 
de JavaScript. 
Nota: Un JSON no es lo mismo que un objeto de JavaScrip, pero son muy similares.
*/
