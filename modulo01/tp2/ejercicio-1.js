var verdadero, char
var valores = [verdadero, false, 2, "hola", "mundo", 3, char];
let text = []
valores.forEach((elem) => {
if(typeof elem == "string") {
text.push(elem)
}
})
alert(text.sort((a, b)=>{return a.length - b.length}));
Function myFunction (array) {
return array + 2
