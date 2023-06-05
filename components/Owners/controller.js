import Owner from "../../models/owner.js"
import { encryptText, decryptText } from "../functions/cryptography.js"
import { Op } from "sequelize"

const loginOwner = (infoOwner) => {
    return new Promise(async (resolve, reject) => {
        try {
            const {user: email, password} = infoOwner
            const userFound = await Owner.findOne({
                where: {
                    email
                },
                 attributes: {
                    exclude: ['createdAt', 'updatedAt']
                 }
            })

            //! user not found
            if (userFound === null) {
                reject({
                    typeError: 'client error', 
                    errorDescription: 'userNotFound',
                    isValid: false
                })
            }

            const {dataValues: userInfo} = userFound
            
            //! password user is incorrect
            if (password !== decryptText(userInfo.password)) {
                reject({
                    typeError: 'client error', 
                    errorDescription: 'incorrectPassword',
                    isValid: false,
                })
            }

            //* user is correct
            userInfo.typeUser = 'Owner'
            resolve({
                userInfo
            })

        } catch (error) {
            //! database error or internal error
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al consultar el usuario para login',
                errorMessage: error
            })
        }
    })   
}

const createOwner = (infoOwner) => {
    return new Promise(async (resolve, reject) => {
        try {
            const {password} = infoOwner
            infoOwner.password = encryptText(password)

            const newOwner = await Owner.create(infoOwner)
            resolve({newOwner, process: 'successfully'})

        } catch (error) {
            reject({process: 'error', error})
        }
    })
}

const findOwners = (params = {}) => {
    return new Promise(async (resolve, reject) => {
        try {
            let owners = await Owner.findAll(params)
            
            if (owners.length === 0) {
                owners = 'Not Owners avaliable'
            }
            
            resolve(owners)
            
        } catch (error) {
            reject(error)
        }
    })
}

const findOwnerByPK = (id) => {
    return new Promise(async (resolve, reject) => {
        try {
            const OwnerFound = await Owner.findByPk(id)

            if (OwnerFound === null){
                reject({
                    typeError: 'client error', 
                    errorDescription: 'userNotFound',
                    isValid: false,
                })
            }

            resolve({
                OwnerInfo : OwnerFound.dataValues
            })

        } catch (error) {
            //! database error or internal error
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al consultar el usuario por primary key',
                errorMessage: error
            })
        }

    })
}

const updateOwner = (data, id) => {
    return new Promise(async (resolve, reject) => {
        try {
            const {password} = data
            data.password = encryptText(password)
            const OwnerUpdate = await Owner.update(data, {
                where: {
                    id
                }
            })

            if (OwnerUpdate[0] !== 1) {
                reject({
                    typeError: 'client error', 
                    errorDescription: 'userNotFound',
                    isValid: false,
                })
            }

            resolve({
                OwnerUpdate
            })

        } catch (error) {
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al actualizar el usuario',
                errorMessage: error
            })
        }
    })
}

const deleteOwner = (id) => {
    return new Promise(async (resolve, reject) => {
        try {

            const OwnerDelete = await Owner.destroy({
                where: {
                    id
                }
            })

            if (OwnerDelete !== 1) {
                reject({
                    typeError: 'client error', 
                    errorDescription: 'userNotFound',
                    isValid: false,
                })
            }

            resolve({
                OwnerDelete
            })
            
        } catch (error) {
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al eliminar el usuario',
                errorMessage: error
            })
        }
    })
}

export {
    loginOwner,
    createOwner,
    findOwners,
    findOwnerByPK,
    updateOwner,
    deleteOwner
}