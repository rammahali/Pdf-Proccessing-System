import 'package:postgrest/postgrest.dart';

import '../UserData.dart';
import '../model.dart';


PostgrestClient connect() {
  const url = 'http://127.0.0.1:3000';
  return PostgrestClient(url);
}


Future<void> getUsers(PostgrestClient db) async {
  var response = await db.from('app_user').select().eq('deleted', false).execute();

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
      privilege: response.data[0]['privilege']
    );
  }
}

Future<User> createUser(User user, PostgrestClient db) async {
  final response = await db.from('app_user').insert([{
    'name': user.name,
    'email': user.email,
    'password': user.password,
    'privilege': user.privilege ?? 'user'
  }]).execute();

  if (response.hasError) {
    throw Exception('Error while inserting user');
  }

  user.id = response.data[0]['id'];
  return user;
}

/// Returns list of projects with the limits specified in [query]
Future<List> getProjects(PostgrestClient db, Project project) async {
  const selectString =
      "id, title, course, keywords:project_keyword!inner(keyword) ,summary, submission_date, authors:student!inner(*), advisor:project_personnel_id_fk!inner(title, first_name, last_name), jury:personnel!project_jury!inner(title, first_name, last_name)";

  var query = db.from('project').select(selectString);

  // only return user's own uploaded projects
  if (UserData.privilege == 'user') {
    query.eq('uploader_id', UserData.id);
  }

  // all projects with ali elbashir as author
  // all projects with ali elbashir and rammah ali as authors
  // authors filter by id
  if (project.authors != null && project.authors!.isNotEmpty) {
    var authors = '(';
    for (var author in project.authors!) {
      authors += '${author.id},';
    }
    authors = authors.substring(0, authors.length - 1);
    authors += ')';

    query.filter('authors.id', 'in', authors);
  }

  // all projects with david malan as advisor
  // advisor filter by id
  if (project.advisor != null) {
    query.filter('advisors.id', 'eq', project.advisor);
  }

  // all projects with yeni haberlesme protokolu as title
  // title filter by name
  if (project.title != null) {
    query.eq('title', project.title);
  }

  // all projects with arastirma problemleri as course
  // course filter by name
  if (project.course != null) {
    query.filter('course', 'eq', 'arastirma problemleri');
  }

  // all projects with david malan in the jury
  // jury filter by id
  if (project.jury != null && project.jury!.isNotEmpty) {
    var jury = '(';
    for (var personnel in project.jury!) {
      jury += '"${personnel.id}",';
    }
    jury = jury.substring(0, jury.length - 1);
    jury += ')';

    query.filter('jury.id', 'in', jury);
  }

  // all projects with submission date guz-2018-2019
  if (project.submissionDate != null) {
    query.filter('submission_date', 'eq', project.submissionDate);
  }

  // all projects with keywords http
  if (project.keywords != null && project.keywords!.isNotEmpty) {
    var keywords = '(';
    for (var keyword in project.keywords!) {
      keywords += '"${keyword}",';
    }
    keywords = keywords.substring(0, keywords.length - 1);
    keywords += ')';

    query.filter('keywords.keyword', 'in', keywords);
  }

  final response = await query.execute();

  if (response.hasError) {
    throw Exception(response.error);
  }

  return response.data;
}

