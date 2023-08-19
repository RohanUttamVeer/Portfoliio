import 'package:hive_flutter/adapters.dart';

import '../../../../../constants/hive_constants.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../domain/usecases/auth_set_is_login.dart';

abstract class AuthLocalDatasource {
  bool setLoggedIn(SetLoginParams params);
  bool getLoggedIn();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final HiveInterface _hive;
  AuthLocalDatasourceImpl(this._hive);

  @override
  setLoggedIn(SetLoginParams params) {
    try {
      var isLoggedBox = _hive.box(isLoggedHive);
      isLoggedBox.put(isLoggedHiveKey, params.value);
      return true;
    } catch (e) {
      throw CacheException('Something went wrong !');
    }
  }

  @override
  bool getLoggedIn() {
    try {
      var isLoggedBox = _hive.box(isLoggedHive);
      return isLoggedBox.get(isLoggedHiveKey) ?? false;
    } catch (e) {
      throw CacheException('Something went wrong !');
    }
  }
}
