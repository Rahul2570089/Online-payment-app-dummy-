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

class Account extends TableRow {
  @override
  String get className => 'Account';
  @override
  String get tableName => 'accounts';

  static final t = AccountTable();

  @override
  int? id;
  late String holderid;
  late String number;
  late String balance;

  Account({
    this.id,
    required this.holderid,
    required this.number,
    required this.balance,
  });

  Account.fromSerialization(Map<String, dynamic> serialization) {
    var _data = unwrapSerializationData(serialization);
    id = _data['id'];
    holderid = _data['holderid']!;
    number = _data['number']!;
    balance = _data['balance']!;
  }

  @override
  Map<String, dynamic> serialize() {
    return wrapSerializationData({
      'id': id,
      'holderid': holderid,
      'number': number,
      'balance': balance,
    });
  }

  @override
  Map<String, dynamic> serializeForDatabase() {
    return wrapSerializationData({
      'id': id,
      'holderid': holderid,
      'number': number,
      'balance': balance,
    });
  }

  @override
  Map<String, dynamic> serializeAll() {
    return wrapSerializationData({
      'id': id,
      'holderid': holderid,
      'number': number,
      'balance': balance,
    });
  }

  @override
  void setColumn(String columnName, value) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'holderid':
        holderid = value;
        return;
      case 'number':
        number = value;
        return;
      case 'balance':
        balance = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Account>> find(
    Session session, {
    AccountExpressionBuilder? where,
    int? limit,
    int? offset,
    Column? orderBy,
    List<Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.find<Account>(
      where: where != null ? where(Account.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Account?> findSingleRow(
    Session session, {
    AccountExpressionBuilder? where,
    int? offset,
    Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Account>(
      where: where != null ? where(Account.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Account?> findById(Session session, int id) async {
    return session.db.findById<Account>(id);
  }

  static Future<int> delete(
    Session session, {
    required AccountExpressionBuilder where,
    Transaction? transaction,
  }) async {
    return session.db.delete<Account>(
      where: where(Account.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    Session session,
    Account row, {
    Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    Session session,
    Account row, {
    Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    Session session,
    Account row, {
    Transaction? transaction,
  }) async {
    return session.db.insert(row, transaction: transaction);
  }

  static Future<int> count(
    Session session, {
    AccountExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.count<Account>(
      where: where != null ? where(Account.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef AccountExpressionBuilder = Expression Function(AccountTable t);

class AccountTable extends Table {
  AccountTable() : super(tableName: 'accounts');

  @override
  String tableName = 'accounts';
  final id = ColumnInt('id');
  final holderid = ColumnString('holderid');
  final number = ColumnString('number');
  final balance = ColumnString('balance');

  @override
  List<Column> get columns => [
        id,
        holderid,
        number,
        balance,
      ];
}

@Deprecated('Use AccountTable.t instead.')
AccountTable tAccount = AccountTable();
