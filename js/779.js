var viol = document.getElementById("vm").hidden = true;
var b4 = document.getElementById("botn4");
b4.addEventListener('click',mostrar_779);

function mostrar_779(){
    viol = document.getElementById("vm").hidden= false;
    window.location.href='#vm';
    viol.focus();
}