var belem = document.getElementById("bp").hidden = true;
var b3 = document.getElementById("botn3");
b3.addEventListener('click',mostrar_belem);

function mostrar_belem(){
    belem = document.getElementById("bp").hidden= false;
    window.location.href='#bp';
    belem.focus();
}