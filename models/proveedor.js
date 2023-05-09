import Database from '../database/connection.js'
import TipoIdentificacion from './tipoIdentificacion.js'
import TipoOperacion from './tipoOperacion.js'
import Empresa from './empresa.js'
import { DataTypes } from 'sequelize'

const Proveedor = Database.define('Proveedores', {
    Proveedor_codigo: {
        type: DataTypes.INTEGER,
        primaryKey: true, 
        allowNull: false, 
        autoIncrement: true
    },

    Proveedor_nombre: {
        type: DataTypes.STRING(60),
        allowNull: false
    },

    Proveedor_num_identificacion: {
        type: DataTypes.STRING(15),
        allowNull: false
    },

    Proveedor_telefono1: {
        type: DataTypes.STRING(15),
        allowNull: false
    },

    Proveedor_telefono2: {
        type: DataTypes.STRING(15),
        allowNull: true
    },

    Proveedor_email: {
        type: DataTypes.STRING(60),
        allowNull: false
    },

    Proveedor_contacto: {
        type: DataTypes.STRING(60),
        allowNull: true
    }, 

    Proveedor_direccion: {
        type: DataTypes.STRING,
        allowNull: true
    }
})

TipoIdentificacion.hasOne(Proveedor, {
    foreignKey: 'Proveedor_tipo_identificacion_FK',
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})
Proveedor.belongsTo(TipoIdentificacion,{
    foreignKey: 'Proveedor_tipo_identificacion_FK',
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})

TipoOperacion.hasOne(Proveedor, {
    foreignKey: 'Proveedor_tipo_operacion_FK',
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})
Proveedor.belongsTo(TipoOperacion,{
    foreignKey: 'Proveedor_tipo_operacion_FK',
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})

Empresa.hasMany(Proveedor, {
    foreignKey: {
        name: 'Proveedor_nit_empresa_FK',
        allowNull: false
    }, 
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})
Proveedor.belongsTo(Empresa, {
    foreignKey: {
        name: 'Proveedor_nit_empresa_FK',
        allowNull: false
    }, 
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})

export default Proveedor