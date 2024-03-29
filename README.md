# Proyecto de reciclaje Katherine Canales

En este proyecto se muestran centros de reciclaje, su ubicación, disponibilidad y material que recibe.

https://github.com/KathyRoo/Proyecto-individual

## How To

1. utilizar el archivo `reciclaje.sql` para llenar la base de datos

2. ejecutar el proyecto
```bash
npm install
npm run dev
```

3. visualizar el resultado en http://localhost:3000

4. API http://localhost:3000/api/puntos-de-reciclaje




# Revision de evaluación

###Selecciona  las columnas requeridas para presentar información
revisar `database.js`
```javascript
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
```


### Utiliza Join 
revisar `database.js`
```javascript
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
```

### Utiliza WHERE
revisar `database.js`
```javascript
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
```




### Utilización correcta de estructuras de datos
Revisar `index.hbs` y `database.js`

### Inclusion de paquetes y librerias de usuario
Revisar `app.js` se incluse importación módulo que contiene la clase

### agrupación del código y separación de funcionalidades

En los distintos archivo se demuestra el apropiado uso de separación de codigo y funcionalidades. 
En particular, 
Se utiliza handlebars para separar las distintas vistas, incAPI se realiza en la vista que corresponde. 
Los llamados a base de datos se realizan desde la clase DatabaseManager.

### Se utiliza de funciones asincróncronicamente. 
Revisar `index.hbs` y `database.js`
```
app.get('/api/puntos-de-reciclaje', async (req, res) => {
  try {
    const result = await dm.getPuntosReciclaje();
    res.json(result.rows);
  } catch (error) {
    console.log('error', error);
    res.status(500).json({ error: error});
  }
});
```

### Conexión desde a base de datos desde node
Revisar `database.js`
```
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
```

### Ejecución y consultas desde node

```
try {
    const result = this.pool.query(query);
    return result;
} catch (error) {
    throw error;
}
```

### Creacion servicio Rest son Express

revisar `app.js` middleware 

```
app.get('/api/puntos-de-reciclaje', async (req, res) => {
  try {
    const result = await dm.getPuntosReciclaje();
    res.json(result.rows);
  } catch (error) {
    console.log('error', error);
    res.status(500).json({ error: error});
  }
});
```