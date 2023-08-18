import 'package:hive_flutter/adapters.dart';

import '../../../../../constants/hive_constants.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../domain/usecases/auth_set_is_login.dart';

abstract class AuthLocalDatasource {
  bool setLoggedIn(SetLoginParams params);
  bool getLoggedIn();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  @override
  setLoggedIn(SetLoginParams params) {
    try {
      var isLoggedBox = Hive.box(isLoggedHive);
      isLoggedBox.put(isLoggedHiveKey, params.value);
      return true;
    } catch (e) {
      throw CacheException('Something went wrong !');
    }
  }

  @override
  bool getLoggedIn() {
    try {
      var isLoggedBox = Hive.box(isLoggedHive);
      return isLoggedBox.get(isLoggedHiveKey) ?? false;
    } catch (e) {
      throw CacheException('Something went wrong !');
    }
  }
}
