import 'package:backend_app_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class AccountEndpoint extends Endpoint {

  Future<Account> createAcc(Session session, Account account) async {
    await Account.insert(session, account);
    return account;
  }

  Future<User> createUser(Session session, User user) async {
    await User.insert(session, user);
    return user;
  }

  Future<Account?> readAcc(Session session, int id) async {
    return await Account.findById(session, id);
  }

  Future<User?> readUser(Session session, int id) async {
    return await User.findById(session, id);
  }

  Future<List<Account>> readAllAcc(Session session) async {
    return await Account.find(session);
  }

  Future<List<User>> readAllUser(Session session) async {
    return await User.find(session);
  }

  Future<Account> updateAcc(Session session, Account account) async {
    await Account.update(session, account);
    return account;
  }

  // Future<void> delete(Session session, int id) async {
  //   await Account.delete(session, where: (account) => account.id.equals(id),);
  // } 
}