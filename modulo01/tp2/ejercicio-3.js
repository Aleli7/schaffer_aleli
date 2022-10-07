//Muestro el texto en la pantalla para que el usuario ingrese un numero
var num = window.prompt ("Introduce un número y se mostrara su factorial");
var factorial = 1;
/*Hago un for para que se vayan multiplicando los números (menores a "num", empezando desde 1)
en loop hasta el que eligió el usuario. Cuando el índice sea igual al número se va a detener y
tendremos el resultado.
*/
for (var i=1; i<=num; i++) {
factorial *= i;
}
//Muestro el resultado en la pantalla con un alert
alert(factorial);
