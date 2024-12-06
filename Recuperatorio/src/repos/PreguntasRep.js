import pg from "pg";
import { DBConfigFacundo } from "./db-facundo.js";

export default class PreguntasRepoFacundo {
    constructor() {
        const { Client } = pg;
        this.DBClient = new Client(DBConfigFacundo);
        this.DBClient.connect();
    }

    async createPregunta(pregunta, fechaCreacion) {
        try {
            const sql = `
                INSERT INTO preguntas
                (pregunta, opcion1, opcion2, opcion3, opcion4, respuesta_correcta, fecha_creacion)
                VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *`;
            const values = [
                pregunta.pregunta,
                pregunta.opcion1,
                pregunta.opcion2,
                pregunta.opcion3,
                pregunta.opcion4,
                pregunta.respuestaCorrecta,
                fechaCreacion
            ];
            const result = await this.DBClient.query(sql, values);
            return result.rows[0];
        } catch (error) {
            console.error("Error al crear la pregunta:", error);
            throw new Error("Error al insertar la pregunta en la base de datos.");
        }
    }

    async getPreguntaById(id) {
        const query = "SELECT * FROM preguntas WHERE id = $1";
        try {
            const values = [id];
            const result = await this.DBClient.query(query, values);
            return result.rows.length > 0 ? result.rows[0] : null;
        } catch (error) {
            console.error("Error al obtener la pregunta por ID:", error);
            throw error;
        }
    }

    async updatePregunta(id, pregunta) {
        try {
            const sql = `
                UPDATE preguntas
                SET
                    pregunta = COALESCE($1, pregunta),
                    opcion1 = COALESCE($2, opcion1),
                    opcion2 = COALESCE($3, opcion2),
                    opcion3 = COALESCE($4, opcion3),
                    opcion4 = COALESCE($5, opcion4),
                    respuesta_correcta = COALESCE($6, respuesta_correcta)
                WHERE id = $7
                RETURNING *;
            `;
            const values = [
                pregunta.pregunta,
                pregunta.opcion1,
                pregunta.opcion2,
                pregunta.opcion3,
                pregunta.opcion4,
                pregunta.respuestaCorrecta,
                id
            ];
            const result = await this.DBClient.query(sql, values);
            return result.rows.length > 0 ? result.rows[0] : null;
        } catch (error) {
            console.error("Error al actualizar la pregunta:", error);
            throw new Error("Error al actualizar la pregunta en la base de datos.");
        }
    }

    async getPreguntaAlAzar() {
        try {
            const sql = "SELECT * FROM preguntas ORDER BY RANDOM() LIMIT 1";
            const result = await this.DBClient.query(sql);
            return result.rows[0] || null;
        } catch (error) {
            console.error("Error al obtener una pregunta al azar:", error);
            throw new Error("Error al obtener una pregunta al azar.");
        }
    }

    async getPreguntas(palabraClave, ordenarPorFecha) {
        try {
            let sql = `SELECT * FROM preguntas`;
            const values = [];

            if (palabraClave) {
                sql += ` WHERE pregunta ILIKE $1`;
                values.push(`%${palabraClave}%`);
            }

            if (ordenarPorFecha) {
                sql += ` ORDER BY fecha_creacion ${ordenarPorFecha === 'asc' ? 'ASC' : 'DESC'}`;
            }

            const result = await this.DBClient.query(sql, values);
            return result.rows;
        } catch (error) {
            console.error("Error al obtener preguntas:", error);
            throw new Error("Error al obtener preguntas.");
        }
    }

    async deletePregunta(id) {
        try {
            const sql = `DELETE FROM preguntas WHERE id = $1 RETURNING *`;
            const values = [id];
            const result = await this.DBClient.query(sql, values);
            return result.rows[0] || null;
        } catch (error) {
            console.error("Error al eliminar la pregunta:", error);
            throw new Error("Error al eliminar la pregunta.");
        }
    }
}