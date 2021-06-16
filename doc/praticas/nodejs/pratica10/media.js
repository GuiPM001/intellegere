/*
39) Usando Node.js e Postman/Insomnia, escreva um algoritmo que receba 3 notas de um
    aluno no intervalo [0, 10], calcule e apresente uma mensagem de acordo com sua
    média.
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

//http://127.0.0.1:8030/media/:nota1/:nota2/:nota3
app.get('/media/:nota1/:nota2/:nota3', function(req, res) {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/html; charset=utf-8');

  let nota1 = parseFloat(req.params.nota1);
  let nota2 = parseFloat(req.params.nota2);
  let nota3 = parseFloat(req.params.nota3);
  let media = ((nota1 + nota2 + nota3) / 3);
  let resultado;

  if(media >= 0 && media < 3) {
    resultado = 'REPROVADO'
  } else if (media >= 3 && media < 7){
    resultado = 'EXAME'
  } else if (media >= 7 && media <= 10) {
    resultado = 'APROVADO'
  }

  let pagina = `
    <html>
      <head>
        <title>Média de notas</title>
        <link rel='stylesheet' href='/media.css'>
      </head>
      <body>
        <div>
          <h2>Média de notas</h2>
          <p>1ª nota: ${nota1}</p>
          <p>2ª nota: ${nota2}</p>
          <p>3ª nota: ${nota3}</p>
          <p>Média: ${media}</p>
          <strong>Resultado: ${resultado}</strong>
        </div>
      </body>
    </html>
    `;

  res.send(pagina);
});