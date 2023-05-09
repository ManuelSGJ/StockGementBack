import Admins from '../../models/admin.js';
import Admin from '../../models/admin.js'
import Empresa from '../../models/empresa.js';
import { encryptText, decryptText } from '../functions/cryptography.js';

export const createAdmin = (infoAdmin) => {
    return new Promise(async (resolve, reject) => {
        const {cedula, nombre, apellido, telefono, direccion, empresa, password} = infoAdmin

        const data = {
            Admin_nombre: nombre,
            Admin_apellido: apellido,
            Admin_cedula: cedula,
            Admin_telefono: telefono,
            Admin_direccion: direccion, 
            Admin_password: encryptText(password),
            Admin_fecha_creacion: new Date(),
            Admin_nit_empresa_FK: empresa
        }

        try {
            const newAdmin = await Admin.create(data)
            resolve({newAdmin, process: 'succesfully'})

        } catch (error) {
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al crear una administrador',
                errorMessage: error
            })
        } 

        resolve(infoAdmin)
    })
}

export const findAdmins = (params) => {
    return new Promise(async (resolve, reject) => {
        try {
            
            let administradores = await Admin.findAll({
                    where: params,
                    include: [
                        {
                            model: Empresa, 
                            attributes: ['empresa_razon_social']
                        }
                    ]
                }
            )

            if (administradores.length === 0) {
                administradores = 'Not admins avaliable'
            }

            resolve(administradores)
        } catch (error) {
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al consultar un administrador',
                errorMessage: error
            })
        }
    })
}

export const findAdminByPK = (id) => {
    return new Promise(async (resolve, reject) => {
        try {
            const adminFound = await Admin.findOne({
                where: {
                    'Admin_cedula': id
                }, 
                include: [
                    {
                        model: Empresa,
                        attributes: ['empresa_razon_social']
                    }
                ]
            })
            
            if (adminFound === null) {
                reject({
                    typeError: 'client error',
                    errorDescription: 'adminNotFound'
                })
            }

            resolve(adminFound)

        } catch (error) {
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al consultar un admin por primary key',
                errorMessage: error
            })
        }
    })
}

export const updateAdmin = (infoAdmin, id) => {
    return new Promise(async (resolve, reject) => {
        try {
            const {cedula, nombre, apellido, telefono, direccion, empresa, password} = infoAdmin
            const data = {
                Admin_nombre: nombre,
                Admin_apellido: apellido,
                Admin_cedula: cedula,
                Admin_telefono: telefono,
                Admin_direccion: direccion, 
                Admin_password: encryptText(password),
                Admin_fecha_creacion: new Date(),
                Admin_nit_empresa_FK: empresa
            }

            const adminUpdated = await Admin.update(data, {
                where: {
                    Admin_cedula: id
                }
            })

            if (adminUpdated[0] !== 1) {
                reject({
                    typeError: 'client error',
                    errorDescription: 'adminNotFound',
                })
            }

            resolve({
                adminUpdated
            })

        } catch (error) {
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al actualizar un admin',
                errorMessage: error
            })
        }
    })
}

export const deleteAdmin = (id) => {
    console.log(id);
    return new Promise(async (resolve, reject) => {
        try {
            let adminDeleted = await Admin.destroy({
                where: {
                    Admin_cedula: id
                }
            })

            if (adminDeleted !== 1) {
                reject({
                    typeError: 'client error', 
                    errorDescription: 'adminNotFound'
                })
            }

            resolve({
                adminDeleted
            })
        } catch (error) {
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al eliminar un administrador',
                errorMessage: error
            })
        }
    })
}