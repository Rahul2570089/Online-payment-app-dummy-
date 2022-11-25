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

class BankAccounts extends SerializableEntity {
  @override
  String get className => 'BankAccounts';

  int? id;
  late String name;
  late String accountNumber;
  late String accountType;
  late String balance;

  BankAccounts({
    this.id,
    required this.name,
    required this.accountNumber,
    required this.accountType,
    required this.balance,
  });

  BankAccounts.fromSerialization(Map<String, dynamic> serialization) {
    var _data = unwrapSerializationData(serialization);
    id = _data['id'];
    name = _data['name']!;
    accountNumber = _data['accountNumber']!;
    accountType = _data['accountType']!;
    balance = _data['balance']!;
  }

  @override
  Map<String, dynamic> serialize() {
    return wrapSerializationData({
      'id': id,
      'name': name,
      'accountNumber': accountNumber,
      'accountType': accountType,
      'balance': balance,
    });
  }
}
