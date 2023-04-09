import { Sequelize, DataTypes } from "sequelize"
import Database from "../database/connection.js"

export const profile = Database.define('profile', {
    id: {
        primaryKey: true,
        autoIncrement: true,
        type: DataTypes.INTEGER
    },
    fullName: {
        type: DataTypes.STRING,
        allowNull: true,
    }
},
{
    timestamps: false
}
)


export const user = Database.define('countSistem', {
    id: {
        primaryKey: true,
        autoIncrement: true,
        type: DataTypes.INTEGER
    },
    DateCration: {
        type: DataTypes.DATEONLY,
        allowNull: true,
    }
},
{
    timestamps: false
}
)

profile.hasOne(user, {
    foreignKey: {
        name: 'profile_id',
        allowNull: false
    },
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})

user.belongsTo(profile, {
    foreignKey: {
        name: 'profile_id',
        allowNull: false
    },
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})


