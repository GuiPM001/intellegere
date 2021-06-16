/*
37) Usando Node.js e Postman/Insomnia, escreva um algoritmo que receba uma
    temperatura em Celsius, calcule e mostre essa temperatura em Fahrenheit.
    OBS: F = (C * 1,8) + 32.
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

//http://127.0.0.1:8030/conversor/:temperatura
app.get('/conversor/:tCelsius', function(req, res) {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/html; charset=utf-8');

  let tCelsius = parseFloat(req.params.tCelsius);
  let tFahrenheit = (tCelsius * 1,8) + 32;
  let pagina = `
  <html>
    <head>
      <title>Conversor de Temperatura</title>
      <link rel='stylesheet' href='/conversor.css'>
    </head>
    <body>
      <h1>Conversor de Celsius para Fahrenheit</h1>
      <div class='celsius'>Celsius: ${tCelsius}°C</div>
      <div class='fahrenheit'>Fahrenheit: ${tFahrenheit}°F</div>
    </body>
  </html>
  `;

  res.send(pagina);
});

