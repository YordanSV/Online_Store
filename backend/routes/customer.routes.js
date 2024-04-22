import { Router } from "express"; //Nos permite crear URLs
<<<<<<< HEAD
import { customerUpdate, registerCustomer } from "../controllers/customer.controller";
=======
import { customerUpdate, selectProductInventory, historial, addInventory } from "../controllers/customer.controller";
>>>>>>> b2b1316817677c9c8487cb30224c42461b5c123d

const router = Router()

// router.get('/products')

router.post('/customer/update', customerUpdate)
<<<<<<< HEAD

router.post('/customer', registerCustomer)
=======
router.post('/customer/historial', historial)
router.post('/inventory', selectProductInventory)
router.post('/addInventory', addInventory)

// router.post('/customer', registerCustomer)
>>>>>>> b2b1316817677c9c8487cb30224c42461b5c123d

// router.get('/products')

// router.delete('/products')

// router.put('/products')

export default router