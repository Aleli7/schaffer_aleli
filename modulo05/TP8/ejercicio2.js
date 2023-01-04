use strict';
let jsonData = require('./personas.json');
//console.log(jsonData);
console.log(JSON.stringify(jsonData));
//console.log(JSON.parse(jsonData));
/*
¿Qué sucede cuando utilizamos JSON.stringify? ¿Por qué?
Cuando utilizamos JSON.stringify nuestro archivo json se mostrará en la consola como una cadena JSON. Porque primero
solicitamos el archivo en la variable jsonData y luego lo mostramos por consola transformado con el método JSON.stringify.
*/
/*
¿Qué sucede cuando utilizamos JSON.parse? ¿Por qué?
Cuando utilizamos el método JSON.parse no se ejecutará el código, nos aparecerá un error de sintáxis. 
La razón es porque esta función recibe y analiza datos para pasarlos a objetos...pero, al parecer, ya concidera como objeto 
al archivo JSON que le pasamos y por eso da error. No se le puede pasar un objeto a JSON.parse porque este solo admite strings.
*/
