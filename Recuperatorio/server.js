import express from "express";
import cors from "cors";

import PreguntasHandler from "./src/controller/preguntas-handler.js";
import RespuestasHandler from "./src/controller/respuestas-handler.js";

const app = express();
app.use(cors());
app.use(express.json());

const port = 3200; 
app.use("/preguntas", PreguntasHandler);
app.use("/respuestas", RespuestasHandler);

app.listen(port, () => {
    console.log(`Servidor de Facundo Yuzefoff corriendo en el puerto ${port}`);
});
 
