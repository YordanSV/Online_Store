// consultaController.js

const express = require('express');
const router = express.Router();
const { ejecutarConsulta } = require('../database/conexionDB');

// Ruta para ejecutar una consulta en la base de datos
router.post('/consultar', async (req, res) => {
    const { consulta } = req.body;
    try {
        const resultado = await ejecutarConsulta(consulta);
        res.json(resultado);
    } catch (error) {
        console.error('Error al ejecutar consulta en la base de datos:', error);
        res.status(500).json({ error: 'Error al ejecutar consulta en la base de datos.' });
    }
});

module.exports = router;
