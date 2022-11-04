/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: public_member_api_docs
// ignore_for_file: unnecessary_import
// ignore_for_file: unused_import

import 'dart:typed_data' as typed_data;
import 'package:serverpod/serverpod.dart';

import 'protocol.dart';

import '../endpoints/example_endpoint.dart';
import '../endpoints/user_endpoint.dart';

class Endpoints extends EndpointDispatch {
  @override
  void initializeEndpoints(Server server) {
    var endpoints = <String, Endpoint>{
      'example': ExampleEndpoint()..initialize(server, 'example', null),
      'user': UserEndpoint()..initialize(server, 'user', null),
    };

    connectors['example'] = EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': MethodConnector(
          name: 'hello',
          params: {
            'name': ParameterDescription(
                name: 'name', type: String, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['example'] as ExampleEndpoint).hello(
              session,
              params['name'],
            );
          },
        ),
      },
    );

    connectors['user'] = EndpointConnector(
      name: 'user',
      endpoint: endpoints['user']!,
      methodConnectors: {
        'create': MethodConnector(
          name: 'create',
          params: {
            'user':
                ParameterDescription(name: 'user', type: User, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['user'] as UserEndpoint).create(
              session,
              params['user'],
            );
          },
        ),
        'read': MethodConnector(
          name: 'read',
          params: {
            'id': ParameterDescription(name: 'id', type: int, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['user'] as UserEndpoint).read(
              session,
              params['id'],
            );
          },
        ),
        'readAll': MethodConnector(
          name: 'readAll',
          params: {},
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['user'] as UserEndpoint).readAll(
              session,
            );
          },
        ),
        'update': MethodConnector(
          name: 'update',
          params: {
            'user':
                ParameterDescription(name: 'user', type: User, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['user'] as UserEndpoint).update(
              session,
              params['user'],
            );
          },
        ),
        'delete': MethodConnector(
          name: 'delete',
          params: {
            'id': ParameterDescription(name: 'id', type: int, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['user'] as UserEndpoint).delete(
              session,
              params['id'],
            );
          },
        ),
      },
    );
  }

  @override
  void registerModules(Serverpod pod) {}
}
