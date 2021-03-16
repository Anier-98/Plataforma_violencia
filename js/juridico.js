var juridico = document.getElementById("mj").hidden = true;
var b1 = document.getElementById("botn1");
b1.addEventListener('click',mostrar_regla_estudiantil);



function mostrar_regla_estudiantil(){
    juridico = document.getElementById("mj").hidden= false;
    window.location.href='#mj';
    juridico.focus();
}

