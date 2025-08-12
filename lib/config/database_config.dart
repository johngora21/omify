class DatabaseConfig {
  // Local Development
  static const String host = 'localhost';
  static const int port = 3306;
  static const String database = 'omify_db';
  static const String username = 'omify_user';
  static const String password = 'omify123';
  
  // Production (will be updated later)
  static const String prodHost = 'your-rds-endpoint.amazonaws.com';
  static const String prodDatabase = 'omify_prod_db';
  
  // Connection timeout
  static const int connectionTimeout = 30; // seconds
  static const int queryTimeout = 60; // seconds
}
