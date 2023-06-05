import Empresa from '../../models/empresa.js';

const createEmpresa = (infoEmpresa) => {
    return new Promise(async (resolve, reject) => {

        const data = {
            empresa_NIT: infoEmpresa.nit,
            empresa_persona_responsable: infoEmpresa.personaResponsable,
            empresa_direccion: infoEmpresa.direccion,
            empresa_razon_social: infoEmpresa.razonSocial,
            empresa_fecha_creacion: new Date(),
            empresa_fecha_licencia: infoEmpresa.fechaExpLicencia
        }

        try {
            const newEmpresa = await Empresa.create(data)
            resolve({newEmpresa, process: 'successfully'})

        } catch (error) {
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al crear una empresa',
                errorMessage: error
            })
        }
    })
}

const findEmpresas = (params) => {
    return new Promise(async (resolve, reject) => {
        try {

            let Empresas = await Empresa.findAll(params)

            if (Empresas.length === 0) {
                Empresas = 'Not empresas Uvaliable'
            }

            resolve(Empresas)
        } catch (error) {
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al conultar empresas',
                errorMessage: error
            })
        }
    })
}

const findEmpresaByPk = (id) => {
    return new Promise(async (resolve, reject) => {
        try {

            let EmpresaFound = await Empresa.findByPk(id)

            if (EmpresaFound === null) {
                reject({
                    typeError: 'client error', 
                    errorDescription: 'empresaNotFound',
                    isValid: false,
                })
            }

            resolve(EmpresaFound)

        } catch (error) {
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al consultar una empresa por primary Key',
                errorMessage: error
            })
        }
    })
}

const updateEmpresa = (infoEmpresa, id) => {
    return new Promise( async (resolve, reject) => {
        try {

            const data = {
                empresa_NIT: infoEmpresa.nit,
                empresa_persona_responsable: infoEmpresa.personaResponsable,
                empresa_direccion: infoEmpresa.direccion,
                empresa_razon_social: infoEmpresa.razonSocial,
                empresa_fecha_licencia: infoEmpresa.fechaExpLicencia
            }

            const EmpresaUpdated = await Empresa.update(data, {
                where: {
                    empresa_NIT: id
                }
            })
        
            if (EmpresaUpdated[0] !== 1) {
                reject({
                    typeError: 'client error', 
                    errorDescription: 'empresaNotFound',
                    isValid: false,
                })
            }

            resolve({
                EmpresaUpdated
            })
            
        } catch (error) {
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al actualizar una empresa',
                errorMessage: error
            })
        }
    })
}

const deleteEmpresa = (id) => {
    return new Promise(async (resolve, reject) => {
        try {

            const EmpresaDelete = await Empresa.destroy({
                where: {
                    empresa_NIT: id
                }
            })

            if (EmpresaDelete !== 1) {
                reject({
                    typeError: 'client error', 
                    errorDescription: 'empresaNotFound',
                    isValid: false,
                })
            }

            resolve({
                EmpresaDelete
            })
            
        } catch (error) {
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al eliminar una empresa',
                errorMessage: error
            })
        }
    })  
}

export {
    createEmpresa,
    findEmpresas,
    findEmpresaByPk,
    updateEmpresa,
    deleteEmpresa
}