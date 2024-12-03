const { Pool } = require('pg')
require('dotenv').config();

const db = {
  user: process.env.DB_USER,
  host:  process.env.DB_HOST,
  database:  process.env.DB_DATABASE ,
  password:  process.env.DB_PASSWORD,
  port:  process.env.DB_PORT ,
  multipleStatements: true
}
const database = new Pool(db);

module.exports = { database };

/*const pool = new Pool({
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    database: process.env.DB_DATABASE,
    password: process.env.DB_PASSWORD,
    port: process.env.DB_PORT,
});

pool.connect()
    .then(() => console.log('Connected to PostgreSQL database'))
    .catch(err => console.error('Connection error', err.stack)); */