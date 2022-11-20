/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: overridden_fields
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: depend_on_referenced_packages

import 'package:serverpod_client/serverpod_client.dart';
import 'dart:typed_data';
import 'protocol.dart';

class User extends SerializableEntity {
  @override
  String get className => 'User';

  int? id;
  late String name;
  late String email;
  late String password;
  late String pin;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.pin,
  });

  User.fromSerialization(Map<String, dynamic> serialization) {
    var _data = unwrapSerializationData(serialization);
    id = _data['id'];
    name = _data['name']!;
    email = _data['email']!;
    password = _data['password']!;
    pin = _data['pin']!;
  }

  @override
  Map<String, dynamic> serialize() {
    return wrapSerializationData({
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'pin': pin,
    });
  }
}
