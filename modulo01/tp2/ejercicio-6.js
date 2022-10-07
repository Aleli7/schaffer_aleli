var vocales = ["a", "e", "i", "o", "u"];
var texto = window.prompt("Inserte un texto");
var textomin = texto.toLowerCase();
var posicion = 0;
var parar = false;
//Inicio un bucle para recorrer el texto ingresado
for (var i = 0; i < textomin.length; i++) {
//Inicio otro for para recorrer el array de vocales
for (var j = 0; j < vocales.length; j++) {
//Inicio un if para saber si hay una vocal en el texto
if (vocales[j] == textomin.charAt(i)) {
//Una vez encontrada la vocal, guardo la posición.
posicion = i;
parar = true;
// Mediante el break, corto la ejecución del bucle.
break;
}
}
if (parar) {
break;
}
}
//Imprimo el resultado
document.write("La primera vocal está en la posición " + posicion);
