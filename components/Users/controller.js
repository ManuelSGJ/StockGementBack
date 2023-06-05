import User from '../../models/user.js'
import Empresa from '../../models/empresa.js'
import { encryptText, decryptText } from '../functions/cryptography.js'

const createUser = (infoUser) => {
    return new Promise(async (resolve, reject) => {
        try {
            const {cedula, nombre, apellido, telefono, empresa, password, sections} = infoUser
            const data = {
                User_cedula: cedula,
                User_nombre: nombre,
                User_apellido: apellido,
                User_password: encryptText(password),
                User_telefono: telefono,
                User_modulos: sections,
                User_nit_empresa_FK: empresa
            }

            const userCreated = await User.create(data)
            resolve(userCreated)

        } catch (error) {
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al crear un usuario',
                errorMessage: error
            })
        }
    })
}

const findUsers = (params) => {
    return new Promise(async (resolve, reject) => {
        try {
            
            let UsersFound = await User.findAll({
                where: params,
                include: [
                    {
                        model: Empresa,
                        attributes: ['empresa_razon_social']
                    }
                ]
            })

            if (UsersFound.length === 0) {
                UsersFound = 'Not users avaliable'
            }

            resolve(UsersFound)

        } catch (error) {
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al consultar uno o varios usuarios',
                errorMessage: error
            })
        }
    })
}

const findUserByPK = (id) => {
    return new Promise(async (resolve, reject) => {
        try {
            
            const userFound = await User.findOne({
                where: {
                    User_cedula: id
                }, 
                include: [
                    {
                        model: Empresa,
                        attributes: ['empresa_razon_social']
                    }
                ]
            })

            if (userFound === null ) {
                reject({
                    typeError: 'client error',
                    errorDescription: 'userNotFound',
                })
            }

            resolve(userFound)

        } catch (error) {
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al consultar un usuario por primary key',
                errorMessage: error
            })
        }
    })
}

const updateUser = (id, infoUser) => {
    return new Promise(async (resolve, reject) => {
        try {

            const {cedula, nombre, apellido, telefono, empresa, password, sections} = infoUser
            const data = {
                User_cedula: cedula,
                User_nombre: nombre,
                User_apellido: apellido,
                User_password: encryptText(password),
                User_telefono: telefono,
                User_modulos: sections,
                User_nit_empresa_FK: empresa
            }

            const userUpdated = await User.update(data, {
                where: {
                    User_cedula: id
                }
            })

            if (userUpdated[0] !== 1) {
                reject({
                    typeError: 'client error', 
                    errorDescription: 'userNotFound',
                })
            }

            resolve({userUpdated})

        } catch (error) {
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al editar un usuario',
                errorMessage: error
            })
        }
    })
}

const deleteUser = (id) => {
    return new Promise(async (resolve, reject) => {
        try {

            const userDeleted = await User.destroy({
                where: {
                    User_cedula: id
                }
            })

            if (userDeleted !== 1) {
                reject({
                    typeError: 'client error', 
                    errorDescription: 'userNotFound',
                })
            }

            resolve({
                userDeleted
            })
            
        } catch (error) {
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al eliminar un usuario',
                errorMessage: error
            })
        }
    })
}

export {
    createUser,
    findUsers,
    findUserByPK,
    updateUser,
    deleteUser
}