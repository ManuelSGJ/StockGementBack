import Database from '../database/connection.js'
import { DataTypes } from 'sequelize'

const TipoIdentificacion = Database.define('Tipo_identificaciones', {
    Codigo: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false
    },

    Tipo_identificacion: {
        type: DataTypes.STRING(60),
        allowNull: false
    }
})

export default TipoIdentificacion