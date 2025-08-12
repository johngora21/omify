import 'package:mysql_client/mysql_client.dart';
import '../config/database_config.dart';

class DatabaseService {
  static DatabaseService? _instance;
  MySQLConnection? _connection;
  
  static DatabaseService get instance {
    _instance ??= DatabaseService._internal();
    return _instance!;
  }
  
  DatabaseService._internal();
  
  Future<MySQLConnection> get connection async {
    if (_connection == null) {
      try {
        _connection = await MySQLConnection.createConnection(
          host: DatabaseConfig.host,
          port: DatabaseConfig.port,
          userName: DatabaseConfig.username,
          password: DatabaseConfig.password,
          databaseName: DatabaseConfig.database,
        );
        
        await _connection!.connect();
        print('✅ Database connected successfully!');
      } catch (e) {
        print('❌ Database connection failed: $e');
        rethrow;
      }
    }
    return _connection!;
  }
  
  Future<void> close() async {
    await _connection?.close();
    _connection = null;
    print('🔌 Database connection closed');
  }
  
  Future<void> testConnection() async {
    try {
      final conn = await connection;
      
      // Test query
      final results = await conn.execute('SELECT 1 as test, NOW() as current_time');
      final row = results.rows.first;
      print('✅ Test query successful: ${row.assoc()['test']} at ${row.assoc()['current_time']}');
      
    } catch (e) {
      print('❌ Database test failed: $e');
      rethrow;
    }
  }
  
  Future<IResultSet> query(String sql) async {
    final conn = await connection;
    return await conn.execute(sql);
  }
}
