import 'package:postgrest/postgrest.dart';

import '../model.dart';


PostgrestClient connect() {
  const url = 'http://127.0.0.1:3000';
  return PostgrestClient(url);
}

void insertUser(PostgrestClient db, Map user) async {
  var response = await db.from('app_user').insert([user]).execute();

  if (response.hasError) {
    throw Exception('Error while inserting user');
  }
}

void getUsers(PostgrestClient db) async {
  var response = await db.from('app_user').select().execute();

  if (response.hasError) {
    throw Exception('Error while inserting user');
  }

  print(response.data);
}

Future<User> login(String email, String password, PostgrestClient db) async {
  final response = await db.from('app_user').select().eq('email', email).eq('password', password).execute();
  if (response.count == 0) {
    throw Exception('user not found');
  } else {
    return User(
      id: response.data[0]['id'],
      name: response.data[0]['name'],
    );
  }
}

Future<User> createUser(User user, PostgrestClient db) async {
  final response = await db.from('app_user').insert([{
    'name': user.name,

  }]).execute();
  if (response.count == 0) {
    throw Exception('user not found');
  } else {
    return User(
      id: response.data[0]['id'],
      name: response.data[0]['name'],
    );
  }

  if (response.hasError) {
    throw Exception('Error while inserting user');
  }
  return user;
}