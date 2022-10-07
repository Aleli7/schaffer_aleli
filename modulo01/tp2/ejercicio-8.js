var cantidadNumeros = 100;
var resultado = []
while(myArray.length < cantidadNumeros ){
var numeroAleatorio = Math.ceil(Math.random()*cantidadNumeros);
var existe = false;
for(var i=0; i<myArray.length; i++) {
if(myArray [i] == numeroAleatorio){
existe = true;
break;
}
}
if(!existe){
Resultado[resultado.length] = numeroAleatorio;
}
}
document.write("números aleatorios : " + myArray);
