/*
Usando Node.js e Postman/Insomnia, escreva um algoritmo que determine a situação de
 peso de um indivíduo determinada através do IMC (Índice de Massa Corpórea). O IMCé
  definido como a relação entre o peso (em kg) e o quadrado da Altura (em m) do indivíduo:
   IMC= PESO / ALTURA2. A situação do peso é indicada na tabela abaixo: 
*/

const express = require('express');
const path = require('path');

var app = express();
var port = 8030;
var hostname = '127.0.0.1';


app.get('/', function(req, res) {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/html; charset=utf-8');


  var id = parseFloat(req.query.id);
  var produto, preco;

  if(id == 1) {
    produto = "Sapato", preco = "R\$ 99,99"
  } else if (id == 2){
    produto = "Bolsa", preco = "R\$ 103,89"
  } else if (id == 3){
    produto = "Camisa", preco = "R\$ 49,98"
  } else if (id == 4){
    produto = "Calça", preco = "R\$ 89,72"
  } else if (id == 5) {
    produto = "Blusa", preco = "R\$ 97,35"
  } else {
    produto = "Sem registro", preco = "sem registro"
  }
    
  res.send("Produto: " + produto + "\n Preço: " + preco);
});


//Iniciar o servidor:
app.listen(port, hostname, function() {
  console.log(`Servidor iniciado com sucesso. Host: ${hostname}. Porta: ${port}`);
});


