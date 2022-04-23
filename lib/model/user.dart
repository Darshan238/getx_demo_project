import 'package:floor/floor.dart';

@entity
class User {

  @PrimaryKey(autoGenerate: true)
  int? id;
  String firstName;
  String lastName;
  String email;
  String password;

  User(
      {this.id,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.password,
      });
}
