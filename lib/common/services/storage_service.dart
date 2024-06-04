import 'package:flutter_secure_storage/flutter_secure_storage.dart';

AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );

class AppService {
  static final FlutterSecureStorage storage = FlutterSecureStorage(
    aOptions: _getAndroidOptions(),
  );
}
