var letras = "Este es un string";
function MayMin(letras) {
If (letras == letras.toUpperCase()) {
return "may";
}
else if (letras == letras.toLowerCase()) {
return "min";
}
else {
return "mayMin";
 }
}
var reveal = MayMin(letras);
alert "La cadena contiene " + reveal;
