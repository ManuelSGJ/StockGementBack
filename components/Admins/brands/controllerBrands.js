import Marca from '../../../models/marca.js'
import { decryptText } from '../../functions/cryptography.js'

const findBrands = (empresa) => {
    return new Promise(async (resolve, reject) => {
        try {
            let brandsFound = await Marca.findAll({
                where: {
                    Marca_nit_empresa_FK: decryptText(empresa)
                }
            })

            if (brandsFound.length === 0) {
                brandsFound = 'brands not found'
            }

            resolve(brandsFound)
        } catch (error) {
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al intentar consultar marcas',
                errorMessage: error
            })
        }
    })
}

const createBrand = (brandInfo) => {
    return new Promise(async (resolve, reject) => {
        try {
            const { nameBrand, empresaBrand } = brandInfo

            const data = {
                Marca_nombre: nameBrand,
                Marca_nit_empresa_FK: decryptText(empresaBrand)
            }

            const newBrand = await Marca.create(data)

            resolve({ newBrand, process: 'succesfully' })
        } catch (error) {
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al intentar crear una nueva marca',
                errorMessage: error
            })
        }
    })
}

const updateBrand = (brandInfo) => {
    return new Promise(async (resolve, reject) => {
        try {
            const { idBrand, nameBrand: newNamebrand } = brandInfo
            const data = {
                Marca_nombre: newNamebrand,
            }

            const brandUpdated = await Marca.update(data, {
                where: {
                    Marca_codigo: idBrand
                }
            })

            if (brandUpdated[0] !== 1) {
                reject({
                    typeError: 'client error',
                    errorDescription: 'brandNotFound',
                })
            }

            resolve({
                brandUpdated
            })
        } catch (error) {
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al intentar actualizar una marca',
                errorMessage: error
            })
        }
    })
}

const deleteBrand = (brandInfo) => {
    return new Promise(async (resolve, reject) => {
        try {
            const { idBrand } = brandInfo

            const brandDeleted = await Marca.destroy({
                where: {
                    Marca_codigo: idBrand
                }
            })

            if (brandDeleted !== 1) {
                reject({
                    typeError: 'client error',
                    errorDescription: 'brandNotFound'
                })
            }

            resolve({
                brandDeleted
            })
        } catch (error) {
            reject({
                typeError: 'client error',
                errorDescription: 'Ha ocurrido un error al intentar eliminar una marca',
                errorMessage: error
            })
        }
    })
}

export {
    findBrands,
    createBrand,
    updateBrand,
    deleteBrand
}