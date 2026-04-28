/// PATRÓN SINGLETON
///
/// Garantiza que una clase tenga una única instancia y proporciona un punto de acceso global
/// Ejemplo: ApiService (ya implementado), DatabaseConnection, Logger
///
/// Características:
/// - Constructor privado (_internal)
/// - Factory constructor que retorna la instancia única
/// - Static final variable que almacena la única instancia

import 'package:http/http.dart' as http;

/// Ejemplo: Logger Singleton
class Logger {
  static final Logger _instance = Logger._internal();

  final List<String> _logs = [];
  late http.Client _httpClient;

  Logger._internal() {
    _httpClient = http.Client();
  }

  /// Factory constructor que retorna la instancia única
  factory Logger() {
    return _instance;
  }

  /// Método estático alternativo para obtener la instancia
  static Logger getInstance() {
    return _instance;
  }

  void log(String message) {
    final timestamp = DateTime.now().toString();
    final logMessage = '[$timestamp] $message';
    _logs.add(logMessage);
    print(logMessage);
  }

  void error(String message) {
    final timestamp = DateTime.now().toString();
    final errorMessage = '[ERROR - $timestamp] $message';
    _logs.add(errorMessage);
    print(errorMessage);
  }

  List<String> getAllLogs() => List.unmodifiable(_logs);

  void clearLogs() {
    _logs.clear();
  }
}

/// Ejemplo: ConfigurationManager Singleton
class ConfigurationManager {
  static final ConfigurationManager _instance =
      ConfigurationManager._internal();

  final Map<String, dynamic> _config = {
    'api_url': 'https://proyecto-apilogin.onrender.com/api',
    'timeout': 30,
    'debug_mode': true,
    'max_retries': 3,
  };

  ConfigurationManager._internal();

  factory ConfigurationManager() {
    return _instance;
  }

  static ConfigurationManager getInstance() {
    return _instance;
  }

  dynamic get(String key) => _config[key];

  void set(String key, dynamic value) {
    _config[key] = value;
  }

  Map<String, dynamic> getAll() => Map.unmodifiable(_config);
}

/// Ejemplo: CacheManager Singleton
class CacheManager {
  static final CacheManager _instance = CacheManager._internal();

  final Map<String, dynamic> _cache = {};

  CacheManager._internal();

  factory CacheManager() {
    return _instance;
  }

  static CacheManager getInstance() {
    return _instance;
  }

  void put(String key, dynamic value) {
    _cache[key] = value;
  }

  dynamic get(String key) => _cache[key];

  bool containsKey(String key) => _cache.containsKey(key);

  void remove(String key) {
    _cache.remove(key);
  }

  void clear() {
    _cache.clear();
  }

  int getCacheSize() => _cache.length;
}
