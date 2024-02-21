import { Router } from "express";
import { insertRegister } from "../controllers/register.controller";

const router = Router()

// router.get('/login', getUserDB);

router.post('/register', insertRegister)

// router.get('/login')

// router.delete('/login')

// router.put('/login')

export default router