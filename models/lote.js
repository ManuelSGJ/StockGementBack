import Database from '../database/connection.js'
import Articulo from './articulo.js'
import { DataTypes } from 'sequelize'

const Lote = Database.define('Lotes', {
    Lote_codigo: {
        type: DataTypes.INTEGER,
        primaryKey: true, 
        autoIncrement: true
    }, 

    Lote_cantidad: {
        type: DataTypes.INTEGER,
        allowNull: false
    },

    Lote_fecha_vencimiento: {
        type: DataTypes.INTEGER,
        allowNull: true
    }
})

Articulo.hasMany(Lote, {
    foreignKey: 'Lote_codigo_articulo_fk',
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})

Lote.belongsTo(Articulo, {
    foreignKey: 'Lote_codigo_articulo_fk',
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})

export default Lote