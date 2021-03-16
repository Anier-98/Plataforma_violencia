    var juri = document.getElementById("ri").hidden = true;
var b2 = document.getElementById("botn2");
b2.addEventListener('click',mostrar_regla_interno);
function mostrar_regla_interno(){
    juri = document.getElementById("ri").hidden= false;
    window.location.href='#ri';
    juri.focus();
}

