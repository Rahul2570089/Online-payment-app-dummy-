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

class Transactions extends SerializableEntity {
  @override
  String get className => 'Transactions';

  int? id;
  late String sender;
  late String receiver;
  late String amount;
  late String date;

  Transactions({
    this.id,
    required this.sender,
    required this.receiver,
    required this.amount,
    required this.date,
  });

  Transactions.fromSerialization(Map<String, dynamic> serialization) {
    var _data = unwrapSerializationData(serialization);
    id = _data['id'];
    sender = _data['sender']!;
    receiver = _data['receiver']!;
    amount = _data['amount']!;
    date = _data['date']!;
  }

  @override
  Map<String, dynamic> serialize() {
    return wrapSerializationData({
      'id': id,
      'sender': sender,
      'receiver': receiver,
      'amount': amount,
      'date': date,
    });
  }
}
