import Database from '../database/connection.js'
import Empresa from './empresa.js'
import { DataTypes } from 'sequelize'


const Marca = Database.define('Marcas', {
    Marca_codigo: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    }, 

    Marca_nombre: {
        type: DataTypes.STRING(60),
        allowNull: false
    }
})

Empresa.hasMany(Marca, {
    foreignKey: {
        name: 'Marca_nit_empresa_FK'
    },
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})
Marca.belongsTo(Empresa, {
    foreignKey: {
        name: 'Marca_nit_empresa_FK'
    },
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})

export default Marca
