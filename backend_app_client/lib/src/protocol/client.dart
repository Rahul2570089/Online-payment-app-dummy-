/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: public_member_api_docs
// ignore_for_file: unused_import
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'dart:typed_data' as typed_data;
import 'package:serverpod_client/serverpod_client.dart';
import 'protocol.dart';

class _EndpointExample extends EndpointRef {
  @override
  String get name => 'example';

  _EndpointExample(EndpointCaller caller) : super(caller);

  Future<String> hello(
    String name,
  ) async {
    var retval = await caller.callServerEndpoint('example', 'hello', 'String', {
      'name': name,
    });
    return retval;
  }
}

class _EndpointAccount extends EndpointRef {
  @override
  String get name => 'account';

  _EndpointAccount(EndpointCaller caller) : super(caller);

  Future<Account> createAcc(
    Account account,
  ) async {
    var retval =
        await caller.callServerEndpoint('account', 'createAcc', 'Account', {
      'account': account,
    });
    return retval;
  }

  Future<User> createUser(
    User user,
  ) async {
    var retval =
        await caller.callServerEndpoint('account', 'createUser', 'User', {
      'user': user,
    });
    return retval;
  }

  Future<Account?> readAcc(
    int id,
  ) async {
    var retval =
        await caller.callServerEndpoint('account', 'readAcc', 'Account', {
      'id': id,
    });
    return retval;
  }

  Future<User?> readUser(
    int id,
  ) async {
    var retval =
        await caller.callServerEndpoint('account', 'readUser', 'User', {
      'id': id,
    });
    return retval;
  }

  Future<List<Account>> readAllAcc() async {
    var retval = await caller
        .callServerEndpoint('account', 'readAllAcc', 'List<Account>', {});
    return (retval as List).cast();
  }

  Future<List<User>> readAllUser() async {
    var retval = await caller
        .callServerEndpoint('account', 'readAllUser', 'List<User>', {});
    return (retval as List).cast();
  }
}

class Client extends ServerpodClient {
  late final _EndpointExample example;
  late final _EndpointAccount account;

  Client(String host,
      {SecurityContext? context,
      ServerpodClientErrorCallback? errorHandler,
      AuthenticationKeyManager? authenticationKeyManager})
      : super(host, Protocol.instance,
            context: context,
            errorHandler: errorHandler,
            authenticationKeyManager: authenticationKeyManager) {
    example = _EndpointExample(this);
    account = _EndpointAccount(this);
  }

  @override
  Map<String, EndpointRef> get endpointRefLookup => {
        'example': example,
        'account': account,
      };

  @override
  Map<String, ModuleEndpointCaller> get moduleLookup => {};
}
