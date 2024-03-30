import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract interface class ILockLocalDatasource {
  Future<bool> hasPasscode();
  Future<void> savePasscode(String passcode);
  Future<void> deletePasscode();
  Future<bool> validatePasscode(String passcode);
}

class LockLocalDatasource implements ILockLocalDatasource {
  final _storage = const FlutterSecureStorage();

  static const _passcodeKey = '#passcode';

  LockLocalDatasource();

  String md5Hash(String input) {
    return md5.convert(input.codeUnits).toString();
  }

  @override
  Future<bool> hasPasscode() async {
    return _storage.containsKey(key: _passcodeKey);
  }

  @override
  Future<void> savePasscode(String passcode) {
    final passcodeHash = md5Hash(passcode);
    return _storage.write(key: _passcodeKey, value: passcodeHash);
  }

  @override
  Future<void> deletePasscode() {
    return _storage.delete(key: _passcodeKey);
  }

  @override
  Future<bool> validatePasscode(String passcode) async {
    final storedPasscodeHash = await _storage.read(key: _passcodeKey) ?? '';
    final passcodeHash = md5Hash(passcode);
    return passcodeHash.compareTo(storedPasscodeHash) == 0;
  }
}
