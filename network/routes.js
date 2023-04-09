import networkOwner from '../components/Owners/network.js'
import networkEmpresas from '../components/Empresas/network.js'

// router App
const router = (App) => {
    App.use('/owners', networkOwner)
    App.use('/empresas', networkEmpresas)
}

export default router