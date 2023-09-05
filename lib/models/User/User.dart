import 'dart:math';

import 'package:hive/hive.dart';

part 'User.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String email;
  @HiveField(2)
  String nickname;

  User(this.id, this.email, this.nickname);

  factory User.fromJson(Map<String, dynamic> user) {
    return User(user['id'], user['email'], user['nickname']);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'email': email, 'nickname': nickname};
  }
}
