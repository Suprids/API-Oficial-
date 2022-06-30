const express = require('express');
const res = require('express/lib/response');
const req = require('express/lib/request');
const app = express()
const port = 3001

app.use(express.json());

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE");
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});


var mysql      = require('mysql');
const { restart } = require('nodemon');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'susu',
  password : '4321',
  database : 'memes_gallery',
  port: 3306
});

 
app.get('/', (req, res) => {
  
connection.query('SELECT * FROM usuario', function (error, results, fields) {
  if (error) throw error;
  res.send(results);
});
 
})


app.get('/post', (req, res) => {
  
  connection.query('select P.id_post as ID, P.descricao, P.postagem as PUBLICACAO, P.feito_em,  U.id_usuario,U.nome_usuario as UserName,U.nome as Nome from post P join usuario U on U.ID_usuario = P.ID_usuario;', function (error, results, fields) {
    if (error) throw error;
    res.send(results);
  });
   
  })

  app.get('/comentario/:id_usuario', (req, res) => {

    const id_usuario = req.params.id_usuario; 
    console.log(req.params)

    const query = `select P.id_post, P.postagem, P.descricao, P.id_usuario, U.foto_perfil, P.feito_em, C.texto as comentario, C.data_comentario, C.id_usuario, U.nome, U.nome_usuario, usuario.nome as nomepost, usuario.nome_usuario as nikipost from comentario C join post P on P.ID_post = C.ID_post join usuario U on U.ID_usuario = C.ID_usuario join usuario on usuario.ID_usuario = P.ID_usuario WHERE P.id_post = ${id_usuario};`;
    //const query = `SELECT * FROM comentario, usuario  WHERE comentario.id_post = ${id_usuario} AND usuario.id_usuario = comentario.id_usuario;`;
  
    connection.query(query, function (error, results, fields) {
      if (error) throw error;
      res.send(result,s);
    });
     
    })



app.get('/teste', (req, res) => {
    res.send('<h1> Teste 1, 2, 3... <h1>')
})

/* autentificação de usuario cadastrado */
app.post('/autentica', (req, res) => {  

  const nome_usuario = req.body.nome_usuario;
  const senha = req.body.senha;
  
  const query = `
       SELECT * FROM usuario WHERE nome_usuario = "${nome_usuario}" and senha = "${senha}";
        `;
  
    connection.query ( query, function (error, results, fields) { 
      if (error) {
        res.status(500)
        res.send(error)
      }
	  
      res.send(results);
    });
     
  })







/* postagem cadastro */

app.post('/usuario', (req, res) => {

const nome = req.body.nome;
const nome_usuario = req.body.nome_usuario;
const senha = req.body.senha;

const query = `
      INSERT INTO usuario 
      (nome, nome_usuario, senha)
      VALUES 
      ("${nome}", "${nome_usuario}", "${senha}");
      `;

   
  connection.query ( query, function (error, results, fields) {
    if (error) {
      res.status(500)
      res.send(error)
    }
    res.send(results);
  });
   
})

{/* postagem do post */}

app.post('/postagem', (req, res) => {


  const descricao = req.body.descricao;
  const postagem = req.body.postagem;
  
  const query = `
        INSERT INTO usuario 
        (descricao, postagem) 
        VALUES 
        ("${descricao}", "${postagem}");
        `;
  
     
    connection.query ( query, function (error, results, fields) {
      if (error) throw error;
      res.send(results);
    });
     
  })


app.listen(port, () => {
  console.log(`Rodando em localhost: ${port}`)
})


