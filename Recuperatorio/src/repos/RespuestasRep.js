import pg from "pg";
import { DBConfigRespuestas } from './db-respuestas.js';
export default class RespuestasRepo {

    constructor() {
        const { Client } = pg;
        this.DBClient = new Client(DBConfigRespuestas);
        this.DBClient.connect();
    }

    async createRespuesta(usuarioId, preguntaId, respuestaElegida, esCorrecta, fechaCreacion) {
        try {
            const sql = `
                INSERT INTO respuestas (user_id, pregunta_id, respuesta_seleccionada, es_correcta, fecha_creacion)
                VALUES ($1, $2, $3, $4, $5) RETURNING *;
            `;
            const values = [usuarioId, preguntaId, respuestaElegida, esCorrecta, fechaCreacion];

            const result = await this.DBClient.query(sql, values);
            return result.rows[0];
        } catch (error) {
            console.error("Error al crear la respuesta:", error);
            throw new Error("Error al registrar la respuesta en la base de datos.");
        }
    }

    async getRespuestas(preguntaId, usuarioId) {
        try {
            let sql = `SELECT * FROM respuestas`;
            const values = [];

            if (preguntaId) {
                sql += ` WHERE pregunta_id = $1`;
                values.push(preguntaId);
            }

            if (usuarioId) {
                sql += values.length > 0 ? ` AND user_id = $2` : ` WHERE user_id = $1`;
                values.push(usuarioId);
            }

            const result = await this.DBClient.query(sql, values);
            return result.rows;
        } catch (error) {
            console.error("Error al obtener respuestas:", error);
            throw new Error("Error al obtener las respuestas desde la base de datos.");
        }
    }
}
