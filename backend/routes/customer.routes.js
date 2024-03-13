import { Router } from "express"; //Nos permite crear URLs
import { customerUpdate, selectProductInventory, historial, addInventory } from "../controllers/customer.controller";

const router = Router()

// router.get('/products')

router.post('/customer/update', customerUpdate)
router.post('/customer/historial', historial)
router.post('/inventory', selectProductInventory)
router.post('/addInventory', addInventory)

// router.post('/customer', registerCustomer)

// router.get('/products')

// router.delete('/products')

// router.put('/products')

export default router