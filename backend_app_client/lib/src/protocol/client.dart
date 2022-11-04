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

class _EndpointUser extends EndpointRef {
  @override
  String get name => 'user';

  _EndpointUser(EndpointCaller caller) : super(caller);

  Future<User> create(
    User user,
  ) async {
    var retval = await caller.callServerEndpoint('user', 'create', 'User', {
      'user': user,
    });
    return retval;
  }

  Future<User?> read(
    int id,
  ) async {
    var retval = await caller.callServerEndpoint('user', 'read', 'User', {
      'id': id,
    });
    return retval;
  }

  Future<List<User>> readAll() async {
    var retval =
        await caller.callServerEndpoint('user', 'readAll', 'List<User>', {});
    return (retval as List).cast();
  }

  Future<User> update(
    User user,
  ) async {
    var retval = await caller.callServerEndpoint('user', 'update', 'User', {
      'user': user,
    });
    return retval;
  }

  Future<void> delete(
    int id,
  ) async {
    var retval = await caller.callServerEndpoint('user', 'delete', 'void', {
      'id': id,
    });
    return retval;
  }
}

class Client extends ServerpodClient {
  late final _EndpointExample example;
  late final _EndpointUser user;

  Client(String host,
      {SecurityContext? context,
      ServerpodClientErrorCallback? errorHandler,
      AuthenticationKeyManager? authenticationKeyManager})
      : super(host, Protocol.instance,
            context: context,
            errorHandler: errorHandler,
            authenticationKeyManager: authenticationKeyManager) {
    example = _EndpointExample(this);
    user = _EndpointUser(this);
  }

  @override
  Map<String, EndpointRef> get endpointRefLookup => {
        'example': example,
        'user': user,
      };

  @override
  Map<String, ModuleEndpointCaller> get moduleLookup => {};
}
