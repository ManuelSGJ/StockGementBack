import { Router } from 'express'
import { Op } from 'sequelize'
import { success, error } from '../../network/response.js'
import { createOwner, findOwners, loginOwner, findOwnerByPK, updateOwner, deleteOwner } from './controller.js';

const router = Router();

router.post('/login', (req, res) => {
    loginOwner(req.body)
    .then((owner) => success(req, res, owner, 200))
    .catch(err => catchError(req, res, err))
})

router.post('/createOwner', (req, res) => {
    for (const element in req.body) {
        if (req.body[element].trim() === ''){
            return error(req, res, 'Datos incompletos', 400, 'datos incompletos para creacion de usuario')
        }
    }
    createOwner(req.body)
    .then((newOwner) => success(req, res, newOwner, 200))
    .catch((err) => error(req, res, 'Ha ocurrido un error', 500, err))
})

router.get('/', (req, res) => {
    findOwners()
    .then((owners) => success(req, res, owners, 200))
    .catch((err) => error(req, res, 'Ha ocurrido un error', 500, err))
})

router.get('/:filter', (req, res) => {
    const filter = req.params.filter
    const params = {
        where : {
            [Op.or] : [
                { cedula: { [Op.like]: `%${filter}%` } },
                { nombre: { [Op.like]: `%${filter}%` } },
                { apellido: { [Op.like]: `%${filter}%` } },
                { email: { [Op.like]: `%${filter}%` } },
            ]
        }
    }

    findOwners(params)
    .then((owners) => success(req, res, owners, 200))
    .catch((err) => error(req, res, 'Ha ocurrido un error', 500, err))
})

router.get('/id/:id', (req, res) => {
    findOwnerByPK(req.params.id)
    .then((owner) => success(req, res, owner, 200))
    .catch(err => catchError(req, res, err))
})

router.put('/updateOwner/:id', (req, res) => {
    for (const element in req.body) {
        if (req.body[element].trim() === ''){
            return error(req, res, 'Datos incompletos', 400, 'datos incompletos para creacion de usuario')
        }
    }
    
    updateOwner(req.body, req.params.id)
    .then((ownerUpdate) => success(req, res, ownerUpdate, 200))
    .catch(err => catchError(req, res, err))
})

router.delete('/deleteOWner/:id', (req, res) => {   
    deleteOwner(req.params.id)
    .then((ownerDelete) => success(req, res, ownerDelete, 200))
    .catch(err => catchError(req, res, err))
})

const catchError = (req, res, err) => {
    if (err.typeError === 'internal error') {
        error(req, res, 'Ha ocurrido un error', 505, err)
    }else{
        error(req, res, err.errorDescription, 500, err)
    }
}


export default router
