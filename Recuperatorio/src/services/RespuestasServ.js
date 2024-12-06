import RespuestasRepo from "../repos/RespuestasRep.js";

const RespuestasRepo = new RespuestasRepo();

export default class RespuestaService {
    async createRespuesta(usuarioId, preguntaId, respuestaElegida, esCorrecta, fechaCreacion) {
        return await RespuestasRepo.createRespuesta(usuarioId, preguntaId, respuestaElegida, esCorrecta, fechaCreacion);
    }

    async getRespuestas(preguntaId, usuarioId) {
        return await RespuestasRepo.getRespuestas(preguntaId, usuarioId);
    }
}
