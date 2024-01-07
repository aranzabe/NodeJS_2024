let valores = require('../models/basededatos')

const funGet = (req, res) => {
    res.status(200).json({'msg':'Contenido del vector','valores':valores})
}

const funGetAt = (req, res) => {
    let indice = parseInt(req.params.id)
    res.status(200).json({'pos':indice, 'valor':valores[indice]})
}

const funPost = (req, res) => {
    let pos = req.body.posicion
    let nuevoValor = req.body.valor

    valores.splice(pos, 0, nuevoValor);
    console.log(valores); 
    res.status(200).json({'msg' : 'Elemento insertado', 'valores' : valores})
}

const funDelete = (req, res) => {
    let indice = parseInt(req.params.id,10)
    valores.splice(indice, 1)
    res.status(200).json({'msg' : 'Elemento borrado', 'valores' : valores})
    console.log(valores)
}

const funPut = (req, res) => {
    let indice = parseInt(req.params.id,10)
    if (indice >= 0 && indice < valores.length){
        valores[indice] = req.body.valor
        res.status(200).json({'msg' : 'Elemento modificado', 'valores' : valores})
    }
    else {
        res.status(203).json({'msg' : 'Error, posición no existe', 'valores' : valores})
    }
}

module.exports = {
    funGet,
    funGetAt,
    funPost,
    funDelete,
    funPut
}