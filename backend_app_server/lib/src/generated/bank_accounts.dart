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

class BankAccounts extends TableRow {
  @override
  String get className => 'BankAccounts';
  @override
  String get tableName => 'bankaccounts';

  static final t = BankAccountsTable();

  @override
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

  @override
  Map<String, dynamic> serializeForDatabase() {
    return wrapSerializationData({
      'id': id,
      'name': name,
      'accountNumber': accountNumber,
      'accountType': accountType,
      'balance': balance,
    });
  }

  @override
  Map<String, dynamic> serializeAll() {
    return wrapSerializationData({
      'id': id,
      'name': name,
      'accountNumber': accountNumber,
      'accountType': accountType,
      'balance': balance,
    });
  }

  @override
  void setColumn(String columnName, value) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'name':
        name = value;
        return;
      case 'accountNumber':
        accountNumber = value;
        return;
      case 'accountType':
        accountType = value;
        return;
      case 'balance':
        balance = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<BankAccounts>> find(
    Session session, {
    BankAccountsExpressionBuilder? where,
    int? limit,
    int? offset,
    Column? orderBy,
    List<Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.find<BankAccounts>(
      where: where != null ? where(BankAccounts.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<BankAccounts?> findSingleRow(
    Session session, {
    BankAccountsExpressionBuilder? where,
    int? offset,
    Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.findSingleRow<BankAccounts>(
      where: where != null ? where(BankAccounts.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<BankAccounts?> findById(Session session, int id) async {
    return session.db.findById<BankAccounts>(id);
  }

  static Future<int> delete(
    Session session, {
    required BankAccountsExpressionBuilder where,
    Transaction? transaction,
  }) async {
    return session.db.delete<BankAccounts>(
      where: where(BankAccounts.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    Session session,
    BankAccounts row, {
    Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    Session session,
    BankAccounts row, {
    Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    Session session,
    BankAccounts row, {
    Transaction? transaction,
  }) async {
    return session.db.insert(row, transaction: transaction);
  }

  static Future<int> count(
    Session session, {
    BankAccountsExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.count<BankAccounts>(
      where: where != null ? where(BankAccounts.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef BankAccountsExpressionBuilder = Expression Function(
    BankAccountsTable t);

class BankAccountsTable extends Table {
  BankAccountsTable() : super(tableName: 'bankaccounts');

  @override
  String tableName = 'bankaccounts';
  final id = ColumnInt('id');
  final name = ColumnString('name');
  final accountNumber = ColumnString('accountNumber');
  final accountType = ColumnString('accountType');
  final balance = ColumnString('balance');

  @override
  List<Column> get columns => [
        id,
        name,
        accountNumber,
        accountType,
        balance,
      ];
}

@Deprecated('Use BankAccountsTable.t instead.')
BankAccountsTable tBankAccounts = BankAccountsTable();
