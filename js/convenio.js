var humano = document.getElementById("dh").hidden = true;
var b5 = document.getElementById("botn5");
b5.addEventListener('click',mostrar_derechos_humanos);

function mostrar_derechos_humanos(){
    humano = document.getElementById("dh").hidden= false;
    window.location.href='#dh';

}