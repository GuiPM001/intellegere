
const express = require('express');
const path = require('path');

var app = express();
var port = 8030;
var hostname = '127.0.0.1';


//Iniciar o servidor:
app.listen(port, hostname, function() {
  console.log(`Servidor iniciado com sucesso. Host: ${hostname}. Porta: ${port}`);
});

//http://127.0.0.1:8030/equacao

app.get('/equacao', function(req, res) {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/html; charset=utf-8');


  var a = parseFloat(req.query.a);
  var b = parseFloat(req.query.b);
  var c = parseFloat(req.query.c);
  
  var delta = Math.pow(b, 2) - 4 * a * c;  
  var x1 = (-b + Math.sqrt(delta)) / (2 * a);
  var x2 = (-b - Math.sqrt(delta)) / (2 * a);
  
  var mensagem;

    if (a === 0 && b === 0)
        if (c != 0)
            mensagem = "Coeficientes informados incorretamente!"    
        else
            mensagem = 'Igualdade confirmada: 0 = 0'
         
    if (delta < 0)
            mensagem = 'A Equação não possui raízes reais!'
    
     if (a === 0 && b != 0)
            mensagem = `Essa é uma equação de primeiro grau!`
    
    if (delta > 0)
             mensagem = `Essa equação possui duas raízes reais diferentes! X1 = ${x1.toFixed(2)}, X2 = ${x2.toFixed(2)}`
   
    if (delta === 0)
            mensagem = `A Equação possui duas raízes reais iguais!  X1 = ${x1.toFixed(2)},  X2 = ${x2.toFixed(2)}`
    
     res.send(mensagem);   
});




