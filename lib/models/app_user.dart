import 'dart:convert';

class AppUser {
  String? uid;
  String? name;
  String? email;
  String? password;
  AppUser({
    this.uid,
    this.name,
    this.email,
    this.password,  });


  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'password':password
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
    );
  }
}
