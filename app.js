// Cargar modulos
const express = require('express');
var hbs = require('express-hbs');
const fs = require('fs');
const path = require('path');

const DatabaseManager = require('./lib/database');

const dm = new DatabaseManager();

// Crear servidor express
const app = express();
const puerto = 3000;

// Permitir archivos estaticos
app.use(express.static('public'));
// Analisis archivos json
app.use(express.json());

// Use `.hbs` for extensions and find partials in `views/partials`.
app.engine('hbs', hbs.express4({
  partialsDir: __dirname + '/views/partials'
}));
app.set('view engine', 'hbs');
app.set('views', __dirname + '/views');
  

app.get('/', (req, res) => {
    res.render('index');
});

app.get('/tips', (req, res) => {
  res.render('tips');
});

app.get('/nosotros', (req, res) => {
  res.render('nosotros');
});

app.get('/login', (req, res) => {
  res.render('login');
});

app.get('/register', (req, res) => {
  res.render('register');
});


app.get('/api/puntos-de-reciclaje', async (req, res) => {
  try {
    const result = await dm.getPuntosReciclaje();
    res.json(result.rows);
  } catch (error) {
    console.log('error', error);
    res.status(500).json({ error: error});
  }
});


// Insertar mas archivos JSON dentro de una pagina
    // const data1 = require('./data1.json');
    // const data2 = require('./data2.json');
    // res.render('template', { data1, data2 });



    //base de datos

    const Pool = require('pg').Pool
const pool = new Pool({
  user: 'kathy',
  host: 'localhost',
  database: 'dondereciclo',
  password: '',
  port: 5432,
})


// pool.query('SELECT * FROM reciclaje', (error, results) => {
//     if (error) {
//       throw error
//     }
//     console.table(results.rows);
// })

// let nombre = 'reciclaje1'
// pool.query('SELECT * FROM usuario where nombre = $1', [nombre], (error, results) => {
//     if (error) {
//       throw error
//     }
//     console.table(results.rows);
// })


// let nombre2 = "reciclaje1' or 1=1--"
// pool.query('SELECT * FROM usuario where nombre = $1', [nombre2], (error, results) => {
//     if (error) {
//       throw error
//     }
//     console.table(results.rows);
// })

// let nombre3 = "reciclaje1'; select * from sbo.master -- "

// console.log("SELECT * FROM reciclaje where nombre = '" + nombre3 +"'")
// pool.query("SELECT * FROM reciclaje where nombre = '" + nombre3 +"'",  (error, results) => {
//     if (error) {
//       throw error
//     }
//     console.table(results.rows);
// })





// Hacer que la app escuche el puerto 3000
app.listen(puerto, () => {
  console.log(`Servicio levantado en http://localhost:${puerto}` );
});