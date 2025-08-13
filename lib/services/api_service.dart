import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://localhost:3000/api'; // Change for production
  static const Duration timeout = Duration(seconds: 30);

  // HTTP Headers
  static Map<String, String> get _defaultHeaders => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static Map<String, String> _authHeaders(String token) => {
    ..._defaultHeaders,
    'Authorization': 'Bearer $token',
  };

  // Generic HTTP methods
  static Future<http.Response> get(String endpoint, {String? token}) async {
    final headers = token != null ? _authHeaders(token) : _defaultHeaders;
    
    return await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
    ).timeout(timeout);
  }

  static Future<http.Response> post(String endpoint, Map<String, dynamic> data, {String? token}) async {
    final headers = token != null ? _authHeaders(token) : _defaultHeaders;
    
    return await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
      body: jsonEncode(data),
    ).timeout(timeout);
  }

  static Future<http.Response> put(String endpoint, Map<String, dynamic> data, {String? token}) async {
    final headers = token != null ? _authHeaders(token) : _defaultHeaders;
    
    return await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
      body: jsonEncode(data),
    ).timeout(timeout);
  }

  static Future<http.Response> delete(String endpoint, {String? token}) async {
    final headers = token != null ? _authHeaders(token) : _defaultHeaders;
    
    return await http.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
    ).timeout(timeout);
  }

  // Response handling
  static Map<String, dynamic> parseResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } catch (e) {
        throw Exception('Invalid JSON response: $e');
      }
    } else {
      throw Exception('HTTP ${response.statusCode}: ${response.body}');
    }
  }

  static List<Map<String, dynamic>> parseListResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        final List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((item) => item as Map<String, dynamic>).toList();
      } catch (e) {
        throw Exception('Invalid JSON response: $e');
      }
    } else {
      throw Exception('HTTP ${response.statusCode}: ${response.body}');
    }
  }

  // Error handling
  static String getErrorMessage(dynamic error) {
    if (error is Exception) {
      return error.toString().replaceAll('Exception: ', '');
    }
    return error.toString();
  }

  // Network connectivity check
  static Future<bool> checkConnectivity() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/health')).timeout(
        const Duration(seconds: 5),
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
