import { DataTypes } from "sequelize";
import Database from "../database/connection.js";
import Empresa from "./empresa.js";

const Admins = Database.define('Administradores', {
    Admin_id: {
        type: DataTypes.INTEGER,
        primaryKey: true, 
        autoIncrement: true,
        allowNull: false
    },
    Admin_nombre: {
        type: DataTypes.STRING, 
        allowNull: false
    },
    Admin_apellido: {
        type: DataTypes.STRING,
        allowNull: false
    },
    Admin_cedula: {
        type: DataTypes.STRING,
        unique: true,
        allowNull: false
    },
    Admin_telefono: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    Admin_direccion: {
        type: DataTypes.STRING,
        allowNull: true,
        defaultValue: ''
    },
    Admin_fecha_creacion: {
        type: DataTypes.DATEONLY,
        allowNull: false
    }
})

Empresa.hasMany(Admins, {
    foreignKey: {
        name: 'Admin_nit_empresa_FK',
        allowNull: false,
    },
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})

Admins.belongsTo(Empresa, {
    foreignKey: {
        name: 'Admin_nit_empresa_FK',
        allowNull: false,
    },
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})

export default Admins