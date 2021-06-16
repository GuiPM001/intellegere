const express = require('express');
const app = express();
const port=8030;
const hostname='localhost';

app.get('/menor', function(req, res){
        let valor1=parseFloat(req.query.valor1);
        let valor2=parseFloat(req.query.valor2);
        let valor3=parseFloat(req.query.valor3);    
        let menor=valor1;
        if(valor2<menor)
            menor=valor2;
        if(valor3<menor)
            menor=valor3;    res.send("O menor número é "+menor);        
    });

    app.get('/maior', function(req, res){
        let valor1=parseFloat(req.query.valor1);
        let valor2=parseFloat(req.query.valor2);
        let valor3=parseFloat(req.query.valor3);
        let maior=valor1;
        if(valor2>maior)
             maior=valor2;
        if(valor3>maior)
             maior=valor3;
        res.send("O maior número é "+maior);        
        });

        app.get('/media', function(req, res){
                let valor1=parseFloat(req.query.valor1);
                let valor2=parseFloat(req.query.valor2);
                let valor3=parseFloat(req.query.valor3);    
                let media = (valor1+valor2+valor3)/3; res.send("A media é "+media);        
            });














app.listen(port, hostname, function(){
    console.log("Rodando!!!");
});
