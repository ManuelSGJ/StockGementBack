import dotenv from 'dotenv'
import {Sequelize} from 'sequelize'
import config from '../conf/config.json' assert { type: 'json' };

dotenv.config();

const Database = new Sequelize(process.env.DB_NAME, process.env.DB_USER, process.env.DB_PASSWORD, config)

Database.authenticate()
.then(() => {
    console.log('Conexion a bd realizada');
})
.catch((err) => {
    console.log(err)
})

export default Database