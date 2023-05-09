import Database from '../database/connection.js'
import { DataTypes } from 'sequelize'

const TipoOperacion = Database.define('Tipo_operacion', {
    Codigo: {
        type: DataTypes.INTEGER,
        primaryKey: true, 
        autoIncrement: true,
        allowNull: false
    },

    Tipo_operacion_nombre: {
        type: DataTypes.STRING(60),
        allowNull: false
    }
})

export default TipoOperacion