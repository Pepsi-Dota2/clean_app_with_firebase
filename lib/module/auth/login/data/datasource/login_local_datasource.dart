import 'package:clean_app/constants/keys/key_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class LoginLocalDatasource {
  Future<void> saveUser({required String uid});
  Future<String> getUser();
  Future<void> deleteUser();
}

@LazySingleton(as: LoginLocalDatasource)
class LoginLocalDatasourceImpl implements LoginLocalDatasource {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  @override
  Future<void> deleteUser() async {
    return await _storage.delete(key: KeyConstants.uid);
  }

  @override
  Future<String> getUser() async {
    return await _storage.read(key: KeyConstants.uid) ?? "";
  }

  @override
  Future<void> saveUser({required String uid}) async {
    await _storage.write(key: KeyConstants.uid, value: uid);
  }
}
