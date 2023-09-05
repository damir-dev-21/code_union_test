import 'package:hive_flutter/hive_flutter.dart';

import '../models/User/User.dart';

User? getUser() {
  Box<User> getUser() => Hive.box<User>('user');
  final user = getUser().get('1');

  if (user != null) {
    return user;
  }
  return null;
}
