var violence = document.getElementById("violencia").hidden=true;
var bt1 = document.getElementById("btn1");
var txt = document.getElementById("intr");
var cls = document.getElementById("cerrar");

bt1.addEventListener('click',mostrar_violencia_test);
cls.addEventListener('click',ocultar_violencia_test);

function mostrar_violencia_test(){
    violence = document.getElementById("violencia").hidden= false;
    window.location.href='#violencia';
    txt.focus();
}

function ocultar_violencia_test(){
    violence = document.getElementById("violencia").hidden= true;
}

