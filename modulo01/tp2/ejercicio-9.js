let nota1, nota2, nota3;
nota1 = prompt('Ingrese 1ra. nota:');
nota2 = prompt('Ingrese 2da. nota:');
nota3 = prompt('Ingrese 3ra. nota:');
let pro;
pro = (nota1 + nota2 + nota3)/ 3;
if (pro > 8) {
document.write('Sobresaliente');
} else {
if (pro >= 6 ^ pro <=8) {
document.write('Aprobado');
} else {
document.write('reprobado');
}
}
