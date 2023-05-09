import networkOwner from '../components/Owners/network.js'
import networkEmpresas from '../components/Empresas/network.js'
import networkAdmins from '../components/Admins/network.js'
import networkUsers from '../components/Users/network.js'

// router App
const router = (App) => {
    App.use('/owners', networkOwner)
    App.use('/empresas', networkEmpresas)
    App.use('/admins', networkAdmins)
    App.use('/users', networkUsers)
}

export default router