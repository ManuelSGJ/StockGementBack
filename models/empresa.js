import { DataTypes } from "sequelize";
import Database from "../database/connection.js";

const Empresa = Database.define('Empresas', {
    empresa_NIT : {
        type: DataTypes.STRING,
        primaryKey: true,
        allowNull: false
    },
    empresa_persona_responsable: {
        type: DataTypes.STRING,
        allowNull: false
    },
    empresa_direccion: {
        type: DataTypes.STRING,
        allowNull: false
    },
    empresa_razon_social: {
        type: DataTypes.STRING,
        allowNull: false
    },
    empresa_fecha_creacion: {
        type: DataTypes.DATEONLY,
        allowNull: false
    },
    empresa_fecha_licencia: {
        type: DataTypes.DATEONLY,
        allowNull: true
    }
})

export default Empresa