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
      'account': AccountEndpoint()..initialize(server, 'account', null),
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

    connectors['account'] = EndpointConnector(
      name: 'account',
      endpoint: endpoints['account']!,
      methodConnectors: {
        'createAcc': MethodConnector(
          name: 'createAcc',
          params: {
            'account': ParameterDescription(
                name: 'account', type: Account, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['account'] as AccountEndpoint).createAcc(
              session,
              params['account'],
            );
          },
        ),
        'createUser': MethodConnector(
          name: 'createUser',
          params: {
            'user':
                ParameterDescription(name: 'user', type: User, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['account'] as AccountEndpoint).createUser(
              session,
              params['user'],
            );
          },
        ),
        'readAcc': MethodConnector(
          name: 'readAcc',
          params: {
            'id': ParameterDescription(name: 'id', type: int, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['account'] as AccountEndpoint).readAcc(
              session,
              params['id'],
            );
          },
        ),
        'readUser': MethodConnector(
          name: 'readUser',
          params: {
            'id': ParameterDescription(name: 'id', type: int, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['account'] as AccountEndpoint).readUser(
              session,
              params['id'],
            );
          },
        ),
        'readAllAcc': MethodConnector(
          name: 'readAllAcc',
          params: {},
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['account'] as AccountEndpoint).readAllAcc(
              session,
            );
          },
        ),
        'readAllUser': MethodConnector(
          name: 'readAllUser',
          params: {},
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['account'] as AccountEndpoint).readAllUser(
              session,
            );
          },
        ),
        'updateAcc': MethodConnector(
          name: 'updateAcc',
          params: {
            'account': ParameterDescription(
                name: 'account', type: Account, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['account'] as AccountEndpoint).updateAcc(
              session,
              params['account'],
            );
          },
        ),
        'createTrans': MethodConnector(
          name: 'createTrans',
          params: {
            'transactions': ParameterDescription(
                name: 'transactions', type: Transactions, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['account'] as AccountEndpoint).createTrans(
              session,
              params['transactions'],
            );
          },
        ),
        'readAllTrans': MethodConnector(
          name: 'readAllTrans',
          params: {},
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['account'] as AccountEndpoint).readAllTrans(
              session,
            );
          },
        ),
      },
    );
  }

  @override
  void registerModules(Serverpod pod) {}
}
