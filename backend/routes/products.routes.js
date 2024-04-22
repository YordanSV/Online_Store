import { Router } from "express"; //Nos permite crear URLs
import { createNewProduct, getProducts } from "../controllers/products.controller";

const router = Router()

router.get('/products', getProducts)

router.post('/products', createNewProduct)

router.get('/products')

router.delete('/products')

router.put('/products')

export default router