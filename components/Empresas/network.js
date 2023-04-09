import { Router } from 'express';
import { Op } from 'sequelize';
import { createEmpresa, findEmpresas, findEmpresaByPk, updateEmpresa, deleteEmpresa } from './controller.js';
import { success, error } from '../../network/response.js';

const router = Router()

router.post('/createEmpresa', (req, res) => {
    for (const element in req.body) {
        if (req.body[element].trim() === ''){
            return error(req, res, 'Datos incompletos', 400, 'datos incompletos para creacion de empresa')
        }
    }

    createEmpresa(req.body)
    .then((newEmpresa) => success(req, res, newEmpresa, 200))
    .catch((err) => error(req, res, 'Ha ocurrido un error', 500, err))
})

router.get('/', (req, res) => {
    findEmpresas({})
    .then((Empresas) => success(req, res, Empresas, 200))
    .catch((err) => catchError(req, res, err))
})

router.get('/:id', (req, res) => {
    const filter = req.params.id
    const params =  {
        where: {
            [Op.or] : [
                {empresa_NIT: {[Op.like] : `%${filter}%`}},
                {empresa_razon_social: {[Op.like]: `%${filter}%`}},
                {empresa_fecha_licencia: {[Op.like]: `%${filter}%`}},
            ]
        }
    }
    findEmpresas(params)
    .then((Empresas) => success(req, res, Empresas, 200))
    .catch((err) => catchError(req, res, err))
})

router.get('/id/:id', (req, res) => {
    findEmpresaByPk(req.params.id)
    .then((Empresa) => success(req, res, Empresa, 200))
    .catch((err) => catchError(req, res, err))
})

router.put('/updateEmpresa/:id', (req, res) => {
    for (const element in req.body) {
        if (req.body[element].trim() === ''){
            return error(req, res, 'Datos incompletos', 400, 'datos incompletos para actualizacion de empresa')
        }
    }

    updateEmpresa(req.body, req.params.id)
    .then(empresaUpdate => success(req, res, empresaUpdate, 200))
    .catch(err => catchError(req, res, err))
})

router.delete('/deleteEmpresa/:id', (req, res) => {
    console.log('Petiicon');
    deleteEmpresa(req.params.id)
    .then(EmpresaDelete => success(req, res, EmpresaDelete, 200))
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