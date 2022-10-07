//Hago un prompt para pedir un valor y que este sea ingresado por el usuario.
mes = prompt("Introduzca el número del mes: ");
mes = parseInt(mes);
//Inicio un if para evaluar qué mes elegio el usuario y devolver un resultado.
if (mes==1 || mes==3 || mes==5 || mes==7 || mes==8 || mes==10 || mes==12)
{
document.write("El mes " + mes + " tiene 31 dias");
}
else
{
if (mes==2);
document.write("El mes " + mes + " puede tener 30 dias o menos");
}
