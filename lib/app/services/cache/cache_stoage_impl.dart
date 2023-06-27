import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quickstart_mvvm/app/services/cache/cache_storage.dart';

class CacheStorageImpl implements CacheStorage {
  const CacheStorageImpl({required this.storage});
  final FlutterSecureStorage storage;

  @override
  Future<void> write(String key, String data) async {
    await storage.write(key: key, value: data);
  }

  @override
  Future<bool> containsKey(String key) async {
    return await storage.containsKey(key: key);
  }

  @override
  Future<String?> read(String key) async {
    return await storage.read(key: key);
  }

  @override
  Future<void> delete(String key) async {
    return await storage.delete(key: key);
  }
}
