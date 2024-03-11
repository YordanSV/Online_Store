import { Router } from "express";
import { getUserDB } from "../controllers/login.controller";

const router = Router()

router.post('/login', getUserDB);

// router.post('/login')

// router.get('/login')

// router.delete('/login')

// router.put('/login')

export default router