import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterSecureStorageService {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> setItem(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<String> getItem(String key) async {
    try {
      return await storage.read(key: key) ?? '';
    } catch (e) {
      // In some cases theres a bug with google drive sync with a new app version and the app crashes so we need to delete all the data and start over
      await deleteAll();
      return '';
    }
  }

  Future<void> deleteItem(String key) async {
    await storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await storage.deleteAll();
  }
}
