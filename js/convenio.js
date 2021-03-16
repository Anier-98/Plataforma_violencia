var belem = document.getElementById("bp").hidden = true;
var b3 = document.getElementById("botn3");
b3.addEventListener('click',mostrar_belem);

function mostrar_belem(){
    belem = document.getElementById("bp").hidden= false;
    window.location.href='#bp';
    belem.focus();
}

var humano = document.getElementById("dh").hidden = true;
var b5 = document.getElementById("botn5");
b5.addEventListener('click',mostrar_derechos_humanos);

function mostrar_derechos_humanos(){
    humano = document.getElementById("dh").hidden= false;
    window.location.href='#dh';
    humano.focus();
}