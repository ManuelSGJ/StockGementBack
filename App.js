import express from 'express'
import Cors from 'cors'
import bodyParser from 'body-parser'
import router from './network/routes.js'
import Database from './database/connection.js'
import './models/importModels.js'

const App = express()
App.use(bodyParser.json())
App.use(Cors())
router(App)

async function main() {
    try {
        await Database.sync()

        App.listen(3001, () => {
            console.log('Connected to localhost on port 3001')
        })
    }
    catch (error) {
        console.error(error)
    }
}

main()
