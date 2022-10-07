//Solicito un numero por pantalla.
var number = window.prompt ("Ingresa un numero entero");
/*Hago una función. Si el numero ingresado se divide por dos y el resto es igual a 0
será par, de lo contrario impar.
*/
function ParImpar(number) {
if(number % 2 == 0 ) {
return "par";
}
else {
return "impar";
}
}
//Cargo una nueva variable con el dato y lo revelo mediante un alert.
var reveal = ParImpar(number);
alert("El numero " + number + " es " + reveal);
