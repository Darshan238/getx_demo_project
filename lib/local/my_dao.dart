import 'package:floor/floor.dart';
import 'package:getx_project_demo/model/user.dart';

@dao
abstract class MyDao {
  @Query('SELECT * FROM User WHERE email = :email AND password = :password')
  Future<User?> getAllUser(String email, String password);

  @Query('SELECT * FROM User WHERE email = :email')
  Stream<User?> getCurrentUser(String email);

  @insert
  Future<void> insertUser(User student);

  @delete
  Future<void> deleteUser(User student);

  @Query('UPDATE User SET Password = :password WHERE email = :email ')
  Future<void> updateUser(
    String password,
    String email,
  );

  @Query('UPDATE User SET firstName = :firstName, lastName = :lastName, email =:email  WHERE email = :emails ')
  Future<void> profileUpdate(String firstName, String lastName, String email, String emails);
}
