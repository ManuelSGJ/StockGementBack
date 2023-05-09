import Database from '../database/connection.js'
import Empresa from './empresa.js'
import { DataTypes } from 'sequelize'

const GrupoArticulo = Database.define('Grupos_articulos', {
    Grupo_codigo: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },

    Grupo_nombre: {
        type: DataTypes.INTEGER,
        allowNull: false
    }
})


Empresa.hasMany(GrupoArticulo, {
    foreignKey: {
        name: 'Grupo_nit_empresa_FK'
    },
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})
Empresa.belongsTo(GrupoArticulo, {
    foreignKey: {
        name: 'Grupo_nit_empresa_FK'
    },
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})

export default GrupoArticulo
