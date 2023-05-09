import Database from '../database/connection.js'
import Articulo from './articulo.js'
import { DataTypes } from 'sequelize'

const HistorialVenta = Database.define('Historial_ventas',{
    Hventa_codigo: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },

    Hventa_cantidad: {
        type: DataTypes.INTEGER,
        allowNull: false
    },

    Hventa_fecha: {
        type: DataTypes.DATE,
        allowNull: false
    },

    Hventa_precio: {
        type: DataTypes.DOUBLE,
        allowNull: false
    },

    Hventa_iva: {
        type: DataTypes.INTEGER,
        allowNull: false
    }
})

Articulo.hasMany(HistorialVenta, {
    foreignKey: 'Hventa_codigo_articulo_FK',
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})
HistorialVenta.belongsTo(Articulo, {
    foreignKey: 'Hventa_codigo_articulo_FK',
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})

export default HistorialVenta