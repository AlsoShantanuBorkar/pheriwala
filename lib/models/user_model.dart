import 'package:isar/isar.dart';

part 'user_model.g.dart';

@collection
class UserModel {
  Id isarId = Isar.autoIncrement;

  int? id;
  String? usercontact;
  String? username;
  String? password;
  double? latitude;
  double? longitude;
  String? notificationToken;

  UserModel(
      {this.id,
      this.usercontact,
      this.username,
      this.password,
      this.latitude,
      this.longitude,
      this.notificationToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usercontact = json['usercontact'];
    username = json['username'];
    password = json['password'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    notificationToken = json['notificationToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['usercontact'] = usercontact;
    data['username'] = username;
    data['password'] = password;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['notificationToken'] = notificationToken;
    return data;
  }
}
