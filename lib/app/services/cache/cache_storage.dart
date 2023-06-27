abstract class CacheStorage {
  Future<void> write(String key, String data);
  Future<bool> containsKey(String key);
  Future<String?> read(String key);
  Future<void> delete(String key);
}
