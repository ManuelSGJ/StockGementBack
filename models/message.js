import {DataTypes} from 'sequelize'
import Database from '../database/connection.js'
import Users from './user.js'

const Messages = Database.define('messages', {
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    textMessage: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    dateMessage: {
        type: DataTypes.DATEONLY,
        allowNull: false,
    }
}, 
    {
        timestamps: true
    }
)

Users.hasMany(Messages, {as: 'Messages', foreignKey: 'userId'})
Messages.belongsTo(Users, {as: 'Users', foreignKey: 'userId'})

export default Messages