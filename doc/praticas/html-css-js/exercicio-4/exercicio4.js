var txt=document.getElementById("texto");
var titulo=document.getElementById("titulo");
var img=document.getElementById("lampada");
var botaoApagar=document.getElementById("botao-apagar");
var botaoAcender=document.getElementById("botao-acender");

function apagar(){
    
    img.src="lampada-off.gif";
    titulo.innerText="APAGADO";
    txt.innerText="Hora de dormir";
    botaoApagar.style.display="none";
    botaoAcender.style.display="block";
    document.body.style.background="black";
    document.body.style.color="white";
}
function acender(){
    img.src="lampada-on.gif";
    titulo.innerText="Aceso";
    txt.innerText="Hora de acordar";
    botaoApagar.style.display="block";
    botaoAcender.style.display="none";
    document.body.style.background="white";
    document.body.style.color="black";
}
