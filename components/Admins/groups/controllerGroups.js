import GrupoArticulo from '../../../models/grupoArticulo.js'
import { decryptText } from '../../functions/cryptography.js'

const findGroups = (empresa) => {
    return new Promise(async (resolve, reject) => {
        try {
            let groupsFound = await GrupoArticulo.findAll({
                where: {
                    Grupo_nit_empresa_FK: decryptText(empresa)
                }
            })

            if (groupsFound.length === 0) {
                groupsFound = 'groups not found'
            }

            resolve(groupsFound)
        } catch (error) {
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al intentar consultar grupos',
                errorMessage: error
            })
        }
    })
}

const createGroup = (groupInfo) => {
    return new Promise(async (resolve, reject) => {
        try {
            const { nameGroup, empresaGroup } = groupInfo

            console.log(nameGroup, empresaGroup);
            const data = {
                Grupo_nombre: nameGroup,
                Grupo_nit_empresa_FK: decryptText(empresaGroup)
            }

            const newGroup = await GrupoArticulo.create(data)

            resolve({ newGroup, process: 'succesfully' })
        } catch (error) {
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al intentar crear un nuevo grupo',
                errorMessage: error
            })
        }
    })
}

const updateGroup = (groupInfo) => {
    return new Promise(async (resolve, reject) => {
        try {
            const { idGroup, nameGroup: newNameGroup } = groupInfo
            const data = {
                Grupo_nombre: newNameGroup,
            }

            const groupUpdated = await GrupoArticulo.update(data, {
                where: {
                    Grupo_codigo: idGroup
                }
            })

            if (groupUpdated[0] !== 1) {
                reject({
                    typeError: 'client error',
                    errorDescription: 'groupNotFound',
                })
            }

            resolve({
                groupUpdated
            })
        } catch (error) {
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al intentar actualizar grupos',
                errorMessage: error
            })
        }
    })
}

const deleteGroup = (groupInfo) => {
    return new Promise(async (resolve, reject) => {
        try {
            const { idGroup } = groupInfo

            const groupDeleted = await GrupoArticulo.destroy({
                where: {
                    Grupo_codigo: idGroup
                }
            })

            if (groupDeleted !== 1) {
                reject({
                    typeError: 'client error',
                    errorDescription: 'groupNotFound'
                })
            }

            resolve({
                groupDeleted
            })
        } catch (error) {
            reject({
                typeError: 'client error',
                errorDescription: 'Ha ocurrido un error al intentar eliminar grupos',
                errorMessage: error
            })
        }
    })
}

export {
    findGroups,
    createGroup,
    updateGroup,
    deleteGroup
}