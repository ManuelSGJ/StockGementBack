import Articulo from '../../../models/articulo.js';
import { decryptText } from '../../functions/cryptography.js';

const findArticles = (empresa) => {
    return new Promise(async (resolve, reject) => {
        try {
            let articlesFound = await Articulo.findAll({
                where: {
                    Articulo_nit_empresa_FK: decryptText(empresa)
                }
            })

            if (articlesFound.length === 0) {
                articlesFound = 'articles not found'
            }

            resolve(articlesFound)
        } catch (error) {
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al intentar consultar articulos',
                errorMessage: error
            })
        }
    })
}

const createArticle = (articleInfo) => {
    return new Promise(async (resolve, reject) => {
        try {
            const { artCode, artName, artCant, artSalePrice, artPercentajeIVA, artPurchasePrice, artUnitMinSale, artInfoAditional, artNotifyCant, artGroup, artBrand, artEmpresa } = articleInfo

            const data = {
                Articulo_codigo: artCode,
                Articulo_descripcion: artName,
                Articulo_cantidad: artCant,
                Articulo_precio_venta: artSalePrice,
                Articulo_iva: artPercentajeIVA, // is pending to parse
                Articulo_precio_compra: artPurchasePrice,
                venta_min: artUnitMinSale,
                Articulo_fecha_ingreso: new Date(),
                Articulo_info_adicional: artInfoAditional,
                Articulo_notificacion_cantidad: artNotifyCant,
                Articulo_grupo_FK: artGroup,
                Articulo_marca_FK: artBrand,
                Articulo_nit_empresa_FK: decryptText(artEmpresa)
            }

            const newArticle = await Articulo.create(data)

            resolve({ newArticle, process: 'succesfuly' })
        } catch (error) {
            reject({
                typeError: 'internal error',
                errorDescription: 'Ha ocurrido un error al intentar crear una nuevo article',
                errorMessage: error
            })
        }
    })
}


export {
    findArticles,
    createArticle,
}