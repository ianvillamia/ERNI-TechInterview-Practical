// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

List<User> mapUserList(List users) {
  List<User> _users = [];
  users.forEach((user) {
    User u = User.fromMap(user);
    _users.add(u);
  });

  //remove duplicates
  for (int x = 0; x < _users.length; x++) {
    if (x < _users.length-1) {
      if (_users[x].name == _users[x + 1].name) {
        _users.removeAt(x);
      }
    }
  }

  return _users;
}

String userToMap(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class User {
  User({
    this.id,
    this.name,
    this.imageUrl,
  });

  String id;
  String name;
  String imageUrl;

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "imageUrl": imageUrl,
      };
}
