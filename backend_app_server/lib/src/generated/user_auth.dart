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

class User extends TableRow {
  @override
  String get className => 'User';
  @override
  String get tableName => 'users';

  static final t = UserTable();

  @override
  int? id;
  late String email;
  late String password;

  User({
    this.id,
    required this.email,
    required this.password,
  });

  User.fromSerialization(Map<String, dynamic> serialization) {
    var _data = unwrapSerializationData(serialization);
    id = _data['id'];
    email = _data['email']!;
    password = _data['password']!;
  }

  @override
  Map<String, dynamic> serialize() {
    return wrapSerializationData({
      'id': id,
      'email': email,
      'password': password,
    });
  }

  @override
  Map<String, dynamic> serializeForDatabase() {
    return wrapSerializationData({
      'id': id,
      'email': email,
      'password': password,
    });
  }

  @override
  Map<String, dynamic> serializeAll() {
    return wrapSerializationData({
      'id': id,
      'email': email,
      'password': password,
    });
  }

  @override
  void setColumn(String columnName, value) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'email':
        email = value;
        return;
      case 'password':
        password = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<User>> find(
    Session session, {
    UserExpressionBuilder? where,
    int? limit,
    int? offset,
    Column? orderBy,
    List<Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.find<User>(
      where: where != null ? where(User.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<User?> findSingleRow(
    Session session, {
    UserExpressionBuilder? where,
    int? offset,
    Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.findSingleRow<User>(
      where: where != null ? where(User.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<User?> findById(Session session, int id) async {
    return session.db.findById<User>(id);
  }

  static Future<int> delete(
    Session session, {
    required UserExpressionBuilder where,
    Transaction? transaction,
  }) async {
    return session.db.delete<User>(
      where: where(User.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    Session session,
    User row, {
    Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    Session session,
    User row, {
    Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    Session session,
    User row, {
    Transaction? transaction,
  }) async {
    return session.db.insert(row, transaction: transaction);
  }

  static Future<int> count(
    Session session, {
    UserExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.count<User>(
      where: where != null ? where(User.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef UserExpressionBuilder = Expression Function(UserTable t);

class UserTable extends Table {
  UserTable() : super(tableName: 'users');

  @override
  String tableName = 'users';
  final id = ColumnInt('id');
  final email = ColumnString('email');
  final password = ColumnString('password');

  @override
  List<Column> get columns => [
        id,
        email,
        password,
      ];
}

@Deprecated('Use UserTable.t instead.')
UserTable tUser = UserTable();
