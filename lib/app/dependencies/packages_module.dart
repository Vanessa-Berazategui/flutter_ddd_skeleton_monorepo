// Package imports:
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppPackagesModule {
  //============================
  // Packages dependencies
  //============================
  @lazySingleton
  FlutterSecureStorage flutterSecureStorage() => const FlutterSecureStorage(
        aOptions: AndroidOptions(
          encryptedSharedPreferences: true,
        ),
      );
}
