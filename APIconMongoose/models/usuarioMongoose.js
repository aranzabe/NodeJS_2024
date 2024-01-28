const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
    id: { type: Number},
    nombre: { type: String },
    edad: { type: Number },
    tfno : { type: String }
}, { collection: 'usuarios' , versionKey: false });

const UserModel = mongoose.model('User', userSchema);

module.exports = UserModel;