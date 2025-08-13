const mysql = require('mysql2/promise');

// Database configuration
const dbConfig = {
  host: process.env.DB_HOST || 'localhost',
  port: process.env.DB_PORT || 3306,
  user: process.env.DB_USER || 'omify_user',
  password: process.env.DB_PASSWORD || 'omify123',
  database: process.env.DB_NAME || 'omify_db',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
  acquireTimeout: 60000,
  timeout: 60000,
  reconnect: true
};

// Create connection pool
let pool;

async function connectDatabase() {
  try {
    pool = mysql.createPool(dbConfig);
    
    // Test connection
    const connection = await pool.getConnection();
    console.log('✅ MySQL connection pool created successfully!');
    
    // Test query
    const [rows] = await connection.execute('SELECT COUNT(*) as tableCount FROM information_schema.tables WHERE table_schema = ?', [dbConfig.database]);
    console.log(`📊 Database has ${rows[0].tableCount} tables`);
    
    connection.release();
    return pool;
  } catch (error) {
    console.error('❌ Database connection failed:', error);
    throw error;
  }
}

function getPool() {
  if (!pool) {
    throw new Error('Database not connected. Call connectDatabase() first.');
  }
  return pool;
}

async function query(sql, params = []) {
  try {
    const pool = getPool();
    const [rows] = await pool.execute(sql, params);
    return rows;
  } catch (error) {
    console.error('Query error:', error);
    throw error;
  }
}

async function queryOne(sql, params = []) {
  try {
    const pool = getPool();
    const [rows] = await pool.execute(sql, params);
    return rows.length > 0 ? rows[0] : null;
  } catch (error) {
    console.error('QueryOne error:', error);
    throw error;
  }
}

async function execute(sql, params = []) {
  try {
    const pool = getPool();
    const [result] = await pool.execute(sql, params);
    return result;
  } catch (error) {
    console.error('Execute error:', error);
    throw error;
  }
}

async function transaction(callback) {
  const pool = getPool();
  const connection = await pool.getConnection();
  
  try {
    await connection.beginTransaction();
    const result = await callback(connection);
    await connection.commit();
    return result;
  } catch (error) {
    await connection.rollback();
    throw error;
  } finally {
    connection.release();
  }
}

module.exports = {
  connectDatabase,
  getPool,
  query,
  queryOne,
  execute,
  transaction
};
