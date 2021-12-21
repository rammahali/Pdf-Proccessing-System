enum EducationType{
  birinciOgretim,
  ikinciOgretim
}

class Project {
  late final Personnel advisor; // danisman
  late final List<Personnel> jury; // juri
  late final Student author;
  late final User uploader; // yukleyen
  late final String course; // ders [arastirma problemleri, bitirme projesi]
  late final String title; // baslik
  late final String summary; // ozet
  late final String submissionDate; // donem
  late final List<String> keywords;
}

class Person {
  late final String firstName; // ad
  late final String lastName; // soyad
}

class Student extends Person {
  late final int id; // ogrenci numarasi
  late final EducationType educationType;
}



class User {
  late final String name;
  late final String email;
  late final String password;
  late final String privilege;
  late final bool deleted;
}

class Personnel extends Person {
  late final String title; // unvan
}
