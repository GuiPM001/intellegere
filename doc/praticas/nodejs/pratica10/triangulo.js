/*
38) Usando Node.js e Postman/Insomnia, escreva um algoritmo que leia os três lados de um
    triângulo e imprima o tipo de triângulo:
      a. Equilátero: os três lados são iguais.
      b. Isósceles: 2 lados são iguais.
      c. Escaleno: 3 lados diferentes.
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
app.get('/triangulo/:lado1/:lado2/:lado3', function(req, res) {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/html; charset=utf-8');


  let lado1 = parseFloat(req.params.lado1);
  let lado2 = parseFloat(req.params.lado2);
  let lado3 = parseFloat(req.params.lado3);
  let tipoTriangulo;

  if(lado1 === lado2 && lado2 === lado3) {
    tipoTriangulo = 'Equilátero'
  } else if (lado1 === lado2 || lado2 === lado3 || lado1 === lado3){
    tipoTriangulo = 'Isóceles'
  } else {
    tipoTriangulo = 'Escaleno'
  }

  let pagina = `
    <html>
      <head>
        <title>Classificando Triângulos</title>
        <link rel='stylesheet' href='/triangulo.css'>
      </head>
      <body>
        <h1>Classificando Triângulos</h1>
        <div class='lados'>
          <div id='lado1'>
            <p>Lado 1:</p>
            <p>${lado1} cm</p>
          </div>
          <div id='lado2'>
            <p>Lado 2:</p>
            <p>${lado2} cm</p>
          </div>
          <div id='lado3'>
            <p>Lado 3:</p>
            <p>${lado3} cm</p>
          </div>
        </div>
        <div class='resultado'>Tipo do triângulo: ${tipoTriangulo}</div>
      </body>
    </html>
  `;

  res.send(pagina);
});