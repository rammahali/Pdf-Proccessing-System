enum EducationType { birinciOgretim, ikinciOgretim }

class Project {
  Personnel? advisor; // danisman
  List<Personnel>? jury; // juri
  List<Student>? authors;
  User? uploader; // yukleyen
  String? course; // ders [arastirma problemleri, bitirme projesi]
  String? title; // baslik
  String? summary; // ozet
  String? submissionDate; // donem
  List<String>? keywords;

  Project(
      {this.advisor,
      this.jury,
      this.authors,
      this.uploader,
      this.course,
      this.title,
      this.summary,
      this.submissionDate,
      this.keywords});
}

class Person {
  String? firstName; // ad
  String? lastName;

  Person({this.firstName, this.lastName}); // soyad

}

class Student extends Person {
  int? id; // ogrenci numarasi
  EducationType? educationType;

  Student({this.id, this.educationType, String? firstName, String? lastName})
      : super(firstName: firstName, lastName: lastName);
}

class User {
  String? name;
  String? email;
  String? password;
  String? privilege;
  bool? deleted;

  User({this.name, this.email, this.password, this.privilege, this.deleted});
}

class Personnel extends Person {
  String? id;
  String? title;

  Personnel({this.id, this.title, String? firstName, String? lastName})
      : super(firstName: firstName, lastName: lastName); // unvan

}
