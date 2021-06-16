function trocar() { 
    var txt = document.getElementById("texto"); 
    var resp = prompt("Digite um texto: "); 
    txt.innerText = resp; txt.style.display = "block"; 
}