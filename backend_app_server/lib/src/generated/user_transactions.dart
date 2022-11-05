/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: overridden_fields
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: depend_on_referenced_packages

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_serialization/serverpod_serialization.dart';
import 'dart:typed_data';
import 'protocol.dart';

class Transactions extends TableRow {
  @override
  String get className => 'Transactions';
  @override
  String get tableName => 'transactions';

  static final t = TransactionsTable();

  @override
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

  @override
  Map<String, dynamic> serializeForDatabase() {
    return wrapSerializationData({
      'id': id,
      'sender': sender,
      'receiver': receiver,
      'amount': amount,
      'date': date,
    });
  }

  @override
  Map<String, dynamic> serializeAll() {
    return wrapSerializationData({
      'id': id,
      'sender': sender,
      'receiver': receiver,
      'amount': amount,
      'date': date,
    });
  }

  @override
  void setColumn(String columnName, value) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'sender':
        sender = value;
        return;
      case 'receiver':
        receiver = value;
        return;
      case 'amount':
        amount = value;
        return;
      case 'date':
        date = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Transactions>> find(
    Session session, {
    TransactionsExpressionBuilder? where,
    int? limit,
    int? offset,
    Column? orderBy,
    List<Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.find<Transactions>(
      where: where != null ? where(Transactions.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Transactions?> findSingleRow(
    Session session, {
    TransactionsExpressionBuilder? where,
    int? offset,
    Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Transactions>(
      where: where != null ? where(Transactions.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Transactions?> findById(Session session, int id) async {
    return session.db.findById<Transactions>(id);
  }

  static Future<int> delete(
    Session session, {
    required TransactionsExpressionBuilder where,
    Transaction? transaction,
  }) async {
    return session.db.delete<Transactions>(
      where: where(Transactions.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    Session session,
    Transactions row, {
    Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    Session session,
    Transactions row, {
    Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    Session session,
    Transactions row, {
    Transaction? transaction,
  }) async {
    return session.db.insert(row, transaction: transaction);
  }

  static Future<int> count(
    Session session, {
    TransactionsExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.count<Transactions>(
      where: where != null ? where(Transactions.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef TransactionsExpressionBuilder = Expression Function(
    TransactionsTable t);

class TransactionsTable extends Table {
  TransactionsTable() : super(tableName: 'transactions');

  @override
  String tableName = 'transactions';
  final id = ColumnInt('id');
  final sender = ColumnString('sender');
  final receiver = ColumnString('receiver');
  final amount = ColumnString('amount');
  final date = ColumnString('date');

  @override
  List<Column> get columns => [
        id,
        sender,
        receiver,
        amount,
        date,
      ];
}

@Deprecated('Use TransactionsTable.t instead.')
TransactionsTable tTransactions = TransactionsTable();
