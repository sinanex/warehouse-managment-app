import 'package:hive/hive.dart';
   part 'userdata.g.dart';
@HiveType(typeId: 1)
class UserData {
  @HiveField(0)
  String name;
  @HiveField(1)
  String email;
  @HiveField(2)
  String password;
  @HiveField(3)
  String? image;
  UserData({
    required this.name,
    required this.email,
    required this.password,
     this.image,
  });
}