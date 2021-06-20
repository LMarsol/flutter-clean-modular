abstract class StorageManager {
  Future<void> saveData(String key, dynamic value);
  Future<dynamic> readData(String key);
  Future<bool> deleteData(String key);
}
