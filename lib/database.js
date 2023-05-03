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

        //crea el Prepared statement
        const query = {
            // give the query a unique name
            name: 'fetch-user',
            text: 'SELECT id, nombre, direccion, comuna, imagen, capacidad FROM puntos_de_reciclaje',
            values: [],
        }

        try {
            const result = this.pool.query(query);
            return result;
        } catch (error) {
            throw error;
        }
    }
}

module.exports = DatabaseManager;