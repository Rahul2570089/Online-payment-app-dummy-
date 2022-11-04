import 'package:backend_app_server/src/generated/user_class.dart';
import 'package:serverpod/serverpod.dart';

class UserEndpoint extends Endpoint {
  Future<User> create(Session session, User user) async {
    await User.insert(session, user);
    return user;
  }

  Future<User?> read(Session session, int id) async {
    return await User.findById(session, id);
  }

  Future<List<User>> readAll(Session session) async {
    return await User.find(session);
  }

  Future<User> update(Session session, User user) async {
    await User.update(session, user);
    return user;
  }

  Future<void> delete(Session session, int id) async {
    await User.delete(session, where: (user) => user.id.equals(id),);
  } 
}