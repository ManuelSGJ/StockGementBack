import Database from '../database/connection.js'
import Empresa from './empresa.js'
import Marca from './marca.js'
import GrupoArticulo from './grupoArticulo.js'
import { DataTypes } from 'sequelize'

const Articulo = Database.define('Articulos', {
    Articulo_codigo: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },

    Articulo_descripcion: {
        type: DataTypes.STRING,
        allowNull: true
    }, 

    Articulo_cantidad: {
        type: DataTypes.INTEGER,
        allowNull: false
    },

    Articulo_precio_venta: {
        type: DataTypes.DOUBLE,
        allowNull: false
    },

    Articulo_iva: {
        type: DataTypes.INTEGER,
        allowNull: false
    },

    Articulo_precio_compra: {
        type: DataTypes.DOUBLE,
        allowNull: false
    },

    venta_min: {
        type: DataTypes.INTEGER,
        allowNull: false
    },

    Articulo_fecha_ingreso: {
        type: DataTypes.DATE,
        allowNull: false
    },

    // Articulo_fecha_caducidad: {
    //* esta va en el lote
    // }

    Articulo_info_adicional: {
        type: DataTypes.STRING,
        allowNull: false
    },

    Articulo_notificacion_cantidad: {
        type: DataTypes.INTEGER,
        allowNull: false
    }
})

GrupoArticulo.hasMany(Articulo, {
    foreignKey: 'Articulo_grupo_FK',
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})
Articulo.belongsTo(GrupoArticulo,{
    foreignKey: 'Articulo_grupo_FK',
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})

Marca.hasMany(Articulo, {
    foreignKey: 'Articulo_marca_FK',
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})
Articulo.belongsTo(Marca,{
    foreignKey: 'Articulo_marca_FK',
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})

Empresa.hasMany(Articulo, {
    foreignKey: 'Articulo_nit_empresa_FK',
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})
Articulo.belongsTo(Empresa, {
    foreignKey: 'Articulo_nit_empresa_FK',
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})

export default Articulo