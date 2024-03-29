const jwt = require('jsonwebtoken')


const generarJWT = (uid = '') => {
    
    //En el token podemos hacer que viaje (en el payload) el id de ese usuario. No supone un gran fallo de seguridad y nos permite sacar la información del mismo en los middleware.
    console.log("UID:" + uid)
    var token = jwt.sign({ uid }, process.env.SECRETORPRIVATEKEY, {
        expiresIn: '4h' // 24 hours
      });
    return token;
}

module.exports ={
    generarJWT
}