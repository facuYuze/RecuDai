import express from "express";
import PreguntasHandlerServiceFacundo from "../services/preguntas-services-facundo.js";

const PreguntasHandlerServiceHandler = new PreguntasHandlerServiceFacundo();
const appRouter = express.Router();
appRouter.get('/', async (req, res) => {
    const { palabraClave, ordenarPorFecha } = req.query;
    console.log(palabraClave, ordenarPorFecha);

    try {
    console.log("Ejecutando operación...");
        const preguntas = await PreguntasHandlerServiceHandler.getPreguntas(palabraClave, ordenarPorFecha);
        return res.status(200).json(preguntas);
    } catch (error) {
        console.error(error);
        return res.status(500).json({ error: 'Ocurrió un error en el servidor.' });
    }
});
appRouter.get('/azar', async (req, res) => {
    try {
    console.log("Ejecutando operación...");
        const pregunta = await PreguntasHandlerServiceHandler.getPreguntaAlAzar();
        if (!pregunta) {
            return res.status(404).json({ error: 'No hay preguntas disponibles.' });
        }
        return res.status(200).json(pregunta);
    } catch (error) {
        console.error(error);
        return res.status(500).json({ error: 'Ocurrió un error en el servidor.' });
    }
});

export default appRouter;