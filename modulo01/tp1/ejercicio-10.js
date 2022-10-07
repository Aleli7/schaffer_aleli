<!DOCTYPE html>
<html>
<head>
<title>Ejercicio 10 </title>
</head>
<body>
<script>
var meses = ['enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio', 'julio', 'agosto',
'septiembre',
'octubre', 'noviembre', 'diciembre'];
let user = prompt ('ingresa un numero entre el 1 y el 12');
for (let i = 0; i < meses.length; i++) {
const mes = meses[i];
if (user == i+1) {
alert(mes)
}
}
</script>
</body>
</html>
