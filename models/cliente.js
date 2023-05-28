import Database from '../database/connection.js'
import Empresa from './empresa.js'
import TipoOperacion from './tipoOperacion.js'
import { DataTypes } from 'sequelize'

const Cliente = Database.define('Clientes', {
    Cliente_codigo: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },

    Cliente_nombre: {
        type: DataTypes.STRING(60),
        allowNull: false
    },

    Cliente_apellido: {
        type: DataTypes.STRING(60),
        allowNull: false
    },

    Cliente_cedula: {
        type: DataTypes.STRING(15),
        allowNull: false
    },

    Cliente_telefono1:{
        type: DataTypes.STRING(15),
        allowNull: false
    },

    Cliente_telefono2: {
        type: DataTypes.STRING(15),
        allowNull: true
    },

    Cliente_contacto: {
        type: DataTypes.STRING(60),
        allowNull: true
    }
})


TipoOperacion.hasMany(Cliente, {
    foreignKey: 'Tipo_operacion_FK',
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})
Cliente.belongsTo(TipoOperacion, {
    foreignKey: 'Tipo_operacion_FK',
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})

Empresa.hasMany(Cliente, {
    foreignKey: 'Cliente_nit_empresa_FK',
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})
Cliente.belongsTo(Empresa, {
    foreignKey: 'Cliente_nit_empresa_FK',
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})

export default Cliente