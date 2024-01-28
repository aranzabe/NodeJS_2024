const express = require('express');
const cors = require('cors');
const mongoose = require("mongoose");
mongoose.set('strictQuery', false);


class Server {

    constructor() {
        this.app = express();
        this.usuariosPath = '/api/usuarios';
        this.comentariosPath = '/api/comentarios';

        //Middlewares
        this.middlewares();

        this.conectarMongoose();

        this.routes();
        
    }

    conectarMongoose() {
        mongoose.connect('mongodb://' + process.env.DB_URL + ':' + process.env.DB_PORT + '/' + process.env.DB_DATABASE, {
            useNewUrlParser: true,
            useUnifiedTopology: true,
        });

        this.db = mongoose.connection;
        this.db.on('error', console.error.bind(console, 'Error de conexión a MongoDB:'));
        this.db.once('open', () => {console.log('Conexión exitosa a MongoDB');});
    }

    middlewares() {
        this.app.use(cors());
        this.app.use(express.json());
    }

    routes(){
        this.app.use(this.usuariosPath , require('../routes/userRoutes'));
        this.app.use(this.comentariosPath , require('../routes/commentsRoutes'));
    }

    listen() {
        this.app.listen(process.env.PORT, () => {
            console.log(`Servidor escuchando en: ${process.env.PORT}`);
        })
    }
}

module.exports = Server;



/*

Si queremos autenticar con Mongo:
En mongosh:

use admin
db.createUser(
  {
    user: "<nombreUsuario>",
    pwd: "<contraseña>",
    roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
  }
)

Y en NodeJS:
const mongoose = require('mongoose');

const url = "mongodb://<nombreUsuario>:<contraseña>@localhost:27017/ejemplo";

mongoose.connect(url, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
});


*/