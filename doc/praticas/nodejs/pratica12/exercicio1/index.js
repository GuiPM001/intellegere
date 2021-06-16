const express = require('express'); // importando o express
const app = express();

express.json();

app.use(express.json());


//Criando vetor de Alunos
alunos = [
    { id: 1, nome: 'aluno1' },
    { id: 2, nome: 'aluno2' },
];

app.get('/alunos', (req, res) => {
    return (res.json(alunos))
});

app.get('/alunos/:id', (req, res) => {
    const id = req.params.id;
    const aluno = alunos.filter(value => value.id == id);
    res.json(aluno);
});

app.post('/alunos', (req, res) => {
    console.log(req.body);
    const aluno = req.body;
    alunos.push(aluno);
    res.json(alunos);

});




app.listen(3000, function () {
    console.log("Servidor Rodando!!!");
});
