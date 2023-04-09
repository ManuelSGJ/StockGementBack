import Database from '../database/connection.js'
import { DataTypes } from 'sequelize'

const Users = Database.define('users', {
    id: {
        type: DataTypes.INTEGER, 
        primaryKey: true, 
        autoIncrement: true
    }, 
    name: {
        type: DataTypes.STRING, 
        allowNull: false, 
    },
    lastName: {
        type: DataTypes.STRING,
        allowNull: false
    }, 
    email: {
        type: DataTypes.STRING, 
        allowNull: false
    },
    birthDate: {
        type: DataTypes.DATE, 
        allowNull: true
    }
}, 
    {
        timestamps: true
    }
)

export default Users