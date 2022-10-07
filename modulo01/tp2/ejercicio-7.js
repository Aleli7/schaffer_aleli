var texto = window.prompt("Ingrese un texto o palabra");
function invertirCadena(cad) {
var separarCadena = cad.split("");
var invertirArreglo = separarCadena.reverse();
var unirArreglo = invertirArreglo.join("");
return unirArreglo;
}
invertirCadena(texto);
var reves = invertirCadena(texto);
alert( reves);
