let valores = require('../models/basededatos')

const enLimite = (req, res, next) => {
    let indice = parseInt(req.params.id,10)
    if (indice >= 0 && indice < valores.length){
        next()
    } else {
        res.status(403).json({'msg' : 'No puedes pasar..'})
    }
}

const otroMid = (req, res, next) => {
    if (1 == 2){
        next()
    } else {
        res.status(403).json({'msg' : 'No puedes pasar llama de Udhüm..'})
    }
}



module.exports = {
    enLimite,
    otroMid
}