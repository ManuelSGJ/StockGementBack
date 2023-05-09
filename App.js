import express  from 'express'
import Cors from 'cors'
import bodyParser from 'body-parser'
import router from './network/routes.js'
import Database from './database/connection.js'
import './models/owner.js'
import './models/empresa.js'
import './models/admin.js'
import './models/user.js'

import './models/tipoIdentificacion.js'
import './models/tipoOperacion.js'
import './models/proveedor.js'
import './models/marca.js'
import './models/grupoArticulo.js'
import './models/articulo.js'
import './models/lote.js'
import './models/historialVenta.js'
import './models/compra.js'

const App = express()
App.use(bodyParser.json())
App.use(Cors())
router(App)

async function main() {
    try {
        await Database.sync()

        App.listen(3001, () => {
            console.log('Connected to localhost on port 3001');
        })
    }
    catch (error) {
        console.error(error);
    }
}

main()