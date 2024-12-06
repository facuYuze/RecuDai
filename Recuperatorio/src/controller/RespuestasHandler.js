
import express from "express";
import RespuestasServ from "../services/RespuestasServ.js";
import PreguntasServ from "../services/PreguntasServ.js";

const respuestasRouter = express.Router();
const respuestasHandlerService = new RespuestasServ();
const preguntasHandlerService = new PreguntasServ();

respuestasRouter.post("/", async (req, res) => {
    const { preguntaId, respuesta, usuario } = req.body;

    try {
    console.log("Ejecutando operación...");
        const esPreguntaValida = await preguntasHandlerService.verificarPregunta(preguntaId);
        if (!esPreguntaValida) {
            return res.status(404).json({ mensaje: "La pregunta no existe." });
        }

        const nuevaRespuesta = await respuestasHandlerService.registrarRespuesta({
            idPregunta: preguntaId,
            textoRespuesta: respuesta,
            usuarioId: usuario
        });

        return res.status(201).json(nuevaRespuesta);
    } catch (error) {
        console.error("Error al registrar respuesta:", error);
        return res.status(500).json({ mensaje: "Error interno del servidor." });
    }
});

export default respuestasRouter;
