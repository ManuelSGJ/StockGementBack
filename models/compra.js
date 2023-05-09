import Database from '../database/connection.js'
import Proveedor from './proveedor.js'
import Articulo from './articulo.js'
import { DataTypes } from 'sequelize'

const Compra = Database.define('Compras', {
    Compra_codigo: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },

    Compra_cantidad: {
        type: DataTypes.INTEGER,
        allowNull: false
    },

    Compra_IVA: {
        type: DataTypes.INTEGER,
        allowNull: false
    },

    Compra_precio: {
        type: DataTypes.DOUBLE,
        allowNull: false
    },

    Compra_referencia: {
        type: DataTypes.STRING(100),
        allowNull: false
    },

    Compra_fecha: {
        type: DataTypes.DATEONLY,
        allowNull: false
    }
})


Articulo.hasMany(Compra, {
    foreignKey: 'Compra_codigo_articulo_FK', 
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})
Compra.belongsTo(Articulo, {
    foreignKey: 'Compra_codigo_articulo_FK', 
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})

Proveedor.hasMany(Compra, {
    foreignKey: 'Compra_codigo_proveedor_FK', 
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})
Compra.belongsTo(Proveedor,{
    foreignKey: 'Compra_codigo_proveedor_FK', 
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})

export default Compra