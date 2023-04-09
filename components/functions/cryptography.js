import Dotenv from 'dotenv'
import CryptoJS from 'crypto-js'

Dotenv.config()

export const encryptText = (text) => {
    return CryptoJS.AES.encrypt(text, process.env.SECRET_KEY).toString()
}

export const decryptText = (text) => {
    const bytes = CryptoJS.AES.decrypt(text, process.env.SECRET_KEY)
    return bytes.toString(CryptoJS.enc.Utf8)
}
