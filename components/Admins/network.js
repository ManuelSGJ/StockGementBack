import { Router } from 'express';
import { Op } from 'sequelize';
import { success, error } from '../../network/response.js';
import { createAdmin, findAdmins, findAdminByPK, updateAdmin, deleteAdmin } from './controller.js';

const router = Router()

router.get('/', (req, res) => {
    findAdmins({})
        .then(administradores => success(req, res, administradores, 200))
        .catch(err => error(req, res, 'Ha ocurrido un error', 500, err))
})

router.get('/:filter', (req, res) => {
    const filter = req.params.filter
    const params = {
        [Op.or]: [
            { Admin_nombre: { [Op.like]: `%${filter}%` } },
            { Admin_apellido: { [Op.like]: `%${filter}%` } },
            { Admin_cedula: { [Op.like]: `%${filter}%` } },
            { Admin_telefono: { [Op.like]: `%${filter}%` } }
        ]
    }
    findAdmins(params)
        .then(administradores => success(req, res, administradores, 200))
        .catch(err => error(req, res, 'Ha ocurrido un error', 500, err))
})

router.get('/id/:id', (req, res) => {
    findAdminByPK(req.params.id)
        .then(infoAdmin => success(req, res, infoAdmin, 200))
        .catch(err => catchError(req, res, err))
})

router.post('/createAdmin', (req, res) => {
    for (const element in req.body) {
        if (req.body[element].trim() === '') {
            return error(req, res, 'Datos incompletos', 400, 'datos incompletos para creacion de empresa')
        }
    }

    createAdmin(req.body)
        .then(newAdmin => success(req, res, newAdmin, 200))
        .catch(err => catchError(req, res, err))
})

router.put('/updateAdmin/:id', (req, res) => {
    for (const element in req.body) {
        if (req.body[element].trim() === '') {
            return error(req, res, 'Datos incompletos', 400, 'datos incompletos para actualizacion de empresa')
        }
    }

    updateAdmin(req.body, req.params.id)
        .then(updateAdmin => success(req, res, updateAdmin, 200))
        .catch(err => catchError(req, res, err))
})

router.delete('/deleteAdmin/:id', (req, res) => {
    deleteAdmin(req.params.id)
        .then(adminDeleted => success(req, res, adminDeleted, 200))
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