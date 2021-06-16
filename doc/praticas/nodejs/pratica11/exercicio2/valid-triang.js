/*
12)Usando Node.js, HTML e CSS, implemente uma API (Application Programming Interface)
que receba três valores X,Ye Zna query stringde uma URLe informe se eles podem,ou não,
 ser os comprimentos dos lados de um triângulo. Em um triangulo, cada lado é menor que a soma dos outros dois lados.
 Os valoresdevem ser informados num formulário HTML, usando o método GET do HTTP.
 Também teste a API usando o Postman/Insomnia
*/

const express = require('express');
const path = require('path');

var app = express();
var port = 8030;
var hostname = '127.0.0.1';

const dir = path.join(__dirname, 'css');
app.use(express.static(dir));

//Iniciar o servidor:
app.listen(port, hostname, function() {
  console.log(`Servidor iniciado com sucesso. Host: ${hostname}. Porta: ${port}`);
});

//http://127.0.0.1:8030/triangulo/:lado1/:lado2/:lado3
app.get('/', function(req, res) {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/html; charset=utf-8');


  var lado1 = parseFloat(req.query.lado1);
  var lado2 = parseFloat(req.query.lado2);
  var lado3 = parseFloat(req.query.lado3);
  var Triangulo;

  if(lado1+lado2 < lado3) {
    Triangulo = 'Não é um triângulo'
  } else if (lado1+lado3 < lado2){
    Triangulo = 'Não é um triângulo'
  } else if (lado2+lado3 < lado1){
    Triangulo = 'Não é um triângulo'
  } else {
    Triangulo = 'É um triângulo'
  }

  res.send(Triangulo);
});