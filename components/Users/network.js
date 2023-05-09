import { Router } from 'express'
import { Op } from 'sequelize';
import { success, error } from '../../network/response.js'
import { createUser, findUsers, findUserByPK, updateUser, deleteUser } from './controller.js'

const router = Router()

router.get('/', (req, res) => {
    findUsers({})
        .then(usersFound => success(req, res, usersFound, 200))
        .catch(err => catchError(req, res, err))
})

router.get('/:filter', (req, res) => {
    const filter = req.params.filter

    const params = {
        [Op.or] : [
            {User_cedula: {[Op.like] : `%${filter}%`}},
            {User_nombre: {[Op.like] : `%${filter}%`}},
            {User_apellido: {[Op.like] : `%${filter}%`}}
        ]
    }

    findUsers(params)
    .then(usersFound => success(req, res, usersFound, 200))
    .catch(err => catchError(req, res, err))
})

router.get('/id/:id', (req, res) => {
    findUserByPK(req.params.id)
        .then(userFound => success(req, res, userFound, 200))
        .catch(err => catchError(req, res, err))
})

router.post('/createUser', (req, res) => {
    for (const element in req.body) {
        if (req.body[element].trim() === '') {
            return error(req, res, 'Datos incompletos', 400, 'datos incompletos para creacion de usuario')
        }
    }

    createUser(req.body)
        .then(userCreated => success(req, res, userCreated, 200))
        .catch(err => catchError(req, res, err))
})

router.put('/updateUser/:id', (req, res) => {
    updateUser(req.params.id, req.body)
    .then(userUpdated => success(req, res, userUpdated, 200))
    .catch(err => catchError(req, res, err))
})

router.delete('/deleteUser/:id', (req, res) => {
    deleteUser(req.params.id)
    .then(userDeleted => success(req, res, userDeleted, 200))
    .catch(err => catchError(req, res, err))
})

const catchError = (req, res, err) => {
    if (err.typeError === 'internal error') {
        error(req, res, 'Ha ocurrido un error', 505, err)
    } else {
        error(req, res, err.errorDescription, 500, err)
    }
}

export default router