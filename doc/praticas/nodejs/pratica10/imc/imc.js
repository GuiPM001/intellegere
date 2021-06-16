/*
Usando Node.js e Postman/Insomnia, escreva um algoritmo que determine a situação de
 peso de um indivíduo determinada através do IMC (Índice de Massa Corpórea). O IMCé
  definido como a relação entre o peso (em kg) e o quadrado da Altura (em m) do indivíduo:
   IMC= PESO / ALTURA2. A situação do peso é indicada na tabela abaixo: 
*/

const express = require('express');
const path = require('path');

var app = express();
var port = 3313;
var hostname = '127.0.0.1';


app.get('/', function(req, res) {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/html; charset=utf-8');


  let altura = parseFloat(req.query.altura);
  let peso = parseFloat(req.query.peso);
  let imc = (peso)/(altura*altura);
  let resultado;

  if(imc < 18.5) {
    resultado = 'Abaixo do peso'
  } else if (imc > 18.6 && imc < 24.9){
    resultado = 'Peso idal (parabéns)'
  } else if (imc > 25.0 && imc < 29.9){
    resultado = 'Levemente acima do peso'
  } else if (imc > 30.0 && imc < 34.9){
    resultado = 'Obesidade Grau 1'
  }else if (imc > 35.0 && imc < 39.9){
    resultado = 'Obesidade Grau 2 (severa)'
  }else {
    resultado = 'Obesidade Grau 3(mórbida)'
  }

  res.send(resultado);
});


//Iniciar o servidor:
app.listen(port, hostname, function() {
  console.log(`Servidor iniciado com sucesso. Host: ${hostname}. Porta: ${port}`);
});


