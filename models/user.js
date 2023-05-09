import { DataTypes } from "sequelize";
import Empresa from "./empresa.js";
import Database from "../database/connection.js";

const User = Database.define('Usuarios', {
    User_id : {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true
    },
    User_cedula : {
        type: DataTypes.STRING(60),
        allowNull: false
    },
    User_nombre : {
        type: DataTypes.STRING(60),
        allowNull: false
    },
    User_apellido: {
        type: DataTypes.STRING(60),
        allowNull: false
    },
    User_password: {
        type: DataTypes.STRING,
        allowNull: false
    },
    User_telefono: {
        type: DataTypes.STRING(20),
        allowNull: false
    },
    User_modulos : {
        type: DataTypes.STRING(100),
        allowNull: false
    }
})

Empresa.hasMany(User, {
    foreignKey : {
        name: 'User_nit_empresa_FK',
        allowNull: false
    },
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})

User.belongsTo(Empresa, {
    foreignKey : {
        name: 'User_nit_empresa_FK',
        allowNull: false
    },
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})


export default User