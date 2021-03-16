var violence = document.getElementById("violencia").hidden = true;
var bt1 = document.getElementById("btn1");
var txt = document.getElementById("intr");
var cls = document.getElementById("cerrar");

bt1.addEventListener('click',mostrar_violencia_test);
cls.addEventListener('click',ocultar_violencia_test);

function mostrar_violencia_test(){
    violence = document.getElementById("violencia").hidden = false;
    window.location.href='#violencia';
    txt.focus();
}

function ocultar_violencia_test(){
    violence = document.getElementById("violencia").hidden= true;
}

var juridico = document.getElementById("mj").hidden = true;
var b1=document.getElementById("botn1");

var txt = document.getElementById("introj");
var b2 = document.getElementById("botn2");

b1.addEventListener('click',mostrar_regla_estudiantil);
function mostrar_regla_estudiantil(){
    juridico = document.getElementById("mj").hidden= false;
    window.location.href='#mj';
    juridico.focus();
}