import { Router } from "express";
import { getUserDB, getCustomer } from "../controllers/login.controller";

const router = Router()

router.post('/login', getUserDB);

router.post('/getPersona', getCustomer);

// router.post('/login')

// router.get('/login')

// router.delete('/login')

// router.put('/login')

export default router