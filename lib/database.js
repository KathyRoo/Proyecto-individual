const { Pool } = require('pg')
 
class DatabaseManager {
    constructor(){
        this.pool = new Pool({
            host: 'localhost',
            user: 'postgres',
            password: 'sasha',
            database: 'reciclaje',
            port: '5432',
            max: 20,
            idleTimeoutMillis: 30000,
            connectionTimeoutMillis: 2000,
          })
    }

    getPool() {
        return this.pool;
    }

    async getPuntosReciclaje() {
        const qText= `
            SELECT 
                pr.id,
                pr.nombre,
                pr.direccion,
                pr.comuna,
                pr.region,
                pr.imagen,
                pr.tipo_residuos,
                c.llenado
            FROM puntos_de_reciclaje pr
            INNER JOIN capacidad c
            ON 
                pr.id = c.punto_de_reciclaje_id
            WHERE
                pr.region = 'V'
        `;

        //crea el Prepared statement
        const query = {
            // give the query a unique name
            name: 'fetch-user',
            text: qText,
            values: [],
        }

        try {
            const result = await this.pool.query(query);
            console.log('result', result);
            return result;
        } catch (error) {
            throw error;
        }
    }
}

module.exports = DatabaseManager;