var valores = ["verdadero", "false", 2, "hola", "mundo", 3, "char"];

let text = []
valores.forEach((elem) => {
    if (typeof elem == "string") {
        text.push(elem)
    }
}); 

alert(text.sort((a, b) => { return a.length - b.length }));

let numbers = []
valores.forEach((elem) => {
    if (typeof elem == "number") {
        numbers.push(elem)
    }
});

alert(numbers);

function suma (numbers){
    return valores + 7;
};

function resta (numbers){
    return valores - 7;
};

function multiplicacion (numbers){
   return  valores * 7;
};

function division (numbers){
   return valores / 7;
};

var operacion1 = valores.map(suma);
var operacion2 = valores.map(resta);
var operacion3 = valores.map(multiplicacon);
var operacion4 = valores.map(division);

alert(operacion1);
alert(operacion2);
alert(operacion3);
alert(operacion4);

