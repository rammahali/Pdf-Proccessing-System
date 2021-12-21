enum EducationType{
  birinciOgretim,
  ikinciOgretim
}

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
}

class Person {
    String? firstName; // ad
  String? lastName; // soyad
}

class Student extends Person {
  int? id; // ogrenci numarasi
  EducationType? educationType;
}



class User {
   String? name;
   String? email;
   String? password;
   String? privilege;
   bool? deleted;
}

class Personnel extends Person {
 String? title; // unvan
}
