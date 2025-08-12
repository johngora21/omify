import 'package:mysql_client/mysql_client.dart';
import 'lib/config/database_config.dart';

void main() async {
  print('🧪 Testing MySQL Database Connection...');
  
  try {
    // Test connection
    final connection = await MySQLConnection.createConnection(
      host: DatabaseConfig.host,
      port: DatabaseConfig.port,
      userName: DatabaseConfig.username,
      password: DatabaseConfig.password,
      databaseName: DatabaseConfig.database,
    );
    
    await connection.connect();
    print('✅ Connected to MySQL successfully!');
    
    // Test simple query first
    final results = await connection.execute('SELECT COUNT(*) as table_count FROM information_schema.tables WHERE table_schema = \'omify_db\'');
    final row = results.rows.first;
    print('📊 Database has ${row.assoc()['table_count']} tables');
    
    // Test a simple query on our tables
    final userResults = await connection.execute('SELECT COUNT(*) as user_count FROM users');
    final userRow = userResults.rows.first;
    print('👥 Users table has ${userRow.assoc()['user_count']} records');
    
    await connection.close();
    print('🔌 Connection closed successfully');
    print('🎉 Database test completed successfully!');
    
  } catch (e) {
    print('❌ Database test failed: $e');
  }
}
