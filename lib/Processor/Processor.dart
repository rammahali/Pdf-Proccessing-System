import 'dart:convert';

import 'package:project3/model.dart';

class Processor {
  String pdfString;

  Processor(this.pdfString);

  late final String formattedPdfText;
  late final String projectType;
  late final String counselor;
  late final String projectTitle;
  late final String semester;
  late final String summary;
  late List<String> lines;
  var authors = [];
  var authorsStudentNumbers = [];
  var juri = [];
  var keywords = [];
  List<Student> studentList = [];

  Personnel danisman = new Personnel();
  List<Personnel> juriDataList = [];

  // -1 means not detected yet
  LineData lineData = LineData(-1, -1, -1, -1, -1, -1, -1, -1);

  Future<void> processText() async {
    // removing all the unnecessary spacing
    formattedPdfText =
        pdfString.replaceAll(new RegExp(r'(?:[\t ]*(?:\r?\n|\r))+'), '\n');
    print(formattedPdfText);
    LineSplitter ls = new LineSplitter();
    lines = ls.convert(formattedPdfText);
    await _getProjectType();
    await _getTitle();
    await _getAuthorsNumber();
    await _getCounselor();
    await _getJuris();
    await _getSemester();
    await _getAuthorsData();
    await _getSummary();
    await _getKeywords();

    print(
        "project type is $projectType found on line number : ${lineData.projectTypeLine}");
    print(
        "project title is $projectTitle found on line number : ${lineData.titleLine}");
    print(
        "authors is/are $authors found on line number : ${lineData.authorsLine}");
    print("juris are $juri found on line number : ${lineData.firstJuriLine}");
    print(
        "semester is $semester found on line number : ${lineData.semesterLine}");
    print(
        "smuuaey is $summary found on line number : ${lineData.semesterLine}");
    print(
        "Keywords are is $keywords found on line number : ${lineData.keyWordsLine}");
  }

  Future<void> _getProjectType() async {
    projectType = lines[3];
    lineData.projectTypeLine = 3;
  }

  Future<void> _getTitle() async {
    // title always comes after the project type as specified on the format
    lineData.titleLine = lineData.projectTypeLine + 1;
    projectTitle = lines[lineData.titleLine];
  }

  Future<void> _getAuthorsNumber() async {
    // authors always comes after the project title as specified on the format
    lineData.authorsLine = lineData.titleLine + 1;

    String authorsLine = lines[lineData.authorsLine];

    if (authorsLine.contains("-")) {
      authors = authorsLine.split("-");
    } else {
      authors.add(authorsLine);
    }
  }

  Future<void> _getCounselor() async {
    lineData.counselorLine = lineData.authorsLine + 1;
    String counselorLine = lines[lineData.counselorLine];
    // var firstSplitter =  counselorLine.split(" Danışman");
    // var formedLine = firstSplitter.first;
    // var secondSplitter =  formedLine.split(". ");
    // counselor = secondSplitter.last;
    // var title =  secondSplitter.first+".";
    // var nameData = getNameSurname(counselor);
    var danismanData = extractDanismanData(counselorLine);
    print("DANISMAN DATA LIST IS $danismanData");
    danisman.title = danismanData.last.trimLeft();
    danisman.firstName = danismanData.first;
    danisman.lastName = danismanData[1];

    print(
        "----------------------- DANISMAN TEST---------------------------------------------------");

    print(danisman.title);
    print(danisman.firstName);
    print(danisman.lastName);
  }

  Future<void> _getJuris() async {
    Personnel firstJuri = new Personnel();
    Personnel secondJuri = new Personnel();
    lineData.firstJuriLine = lineData.counselorLine + 1;
    lineData.secondJuriLine = lineData.firstJuriLine + 1;

    var firstJuriLine = lines[lineData.firstJuriLine];
    var secondJuriLine = lines[lineData.secondJuriLine];

    var firstJuriData = extractJuriData(firstJuriLine);
    var secondJuriData = extractJuriData(secondJuriLine);
    firstJuri.title = firstJuriData.last;
    firstJuri.firstName = firstJuriData.first;
    firstJuri.lastName = firstJuriData[1];

    secondJuri.title = secondJuriData.last;
    secondJuri.firstName = secondJuriData.first;
    secondJuri.lastName = secondJuriData[1];

    juriDataList.add(firstJuri);
    juriDataList.add(secondJuri);

    print(
        "----------------------- Juri TEST---------------------------------------------------");

    print(firstJuri.title);
    print(firstJuri.firstName);
    print(firstJuri.lastName);

    print(secondJuri.title);
    print(secondJuri.firstName);
    print(secondJuri.lastName);
  }

  List<String> extractJuriData(String juriLine) {
    var firstSplitter = juriLine.split(" Jüri");
    var formedLine = firstSplitter.first;
    var secondSplitter = [];
    if (juriLine.contains(". Üyesi")) {
      secondSplitter = formedLine.split("Üyesi ");

      String title = secondSplitter.first + "Üyesi";
      String formattedTitle = title.trimLeft();
      var juriName = secondSplitter.last;
      var firstLastName = getNameSurname(juriName);
      var firstName = firstLastName.first;
      var lastName = firstLastName.last;
      return [firstName, lastName, formattedTitle];
    } else {
      secondSplitter = formedLine.split(". ");
      String title = secondSplitter.first + ".";
      String formattedTitle = title.trimLeft();
      var juriName = secondSplitter.last;
      var firstLastName = getNameSurname(juriName);
      var firstName = firstLastName.first;
      var lastName = firstLastName.last;
      return [firstName, lastName, formattedTitle];
    }
  }

  List<String> extractDanismanData(String danismanLine) {
    var firstSplitter = danismanLine.split(" Danışman");
    var formedLine = firstSplitter.first;
    var secondSplitter = [];
    if (danismanLine.contains(". Üyesi")) {
      secondSplitter = formedLine.split("Üyesi ");

      String title = secondSplitter.first + "Üyesi";
      String formattedTitle = title.trimLeft();
      var juriName = secondSplitter.last;
      var firstLastName = getNameSurname(juriName);
      var firstName = firstLastName.first;
      var lastName = firstLastName.last;
      return [firstName, lastName, formattedTitle];
    } else {
      secondSplitter = formedLine.split(". ");
      String title = secondSplitter.first + ".";
      String formattedTitle = title.trimLeft();
      var juriName = secondSplitter.last;
      var firstLastName = getNameSurname(juriName);
      var firstName = firstLastName.first;
      var lastName = firstLastName.last;
      return [firstName, lastName, formattedTitle];
    }
  }

  Future<void> _getSemester() async {
    lineData.semesterLine = lineData.secondJuriLine + 1;
    var dateline = lines[lineData.semesterLine];
    var dateStringGetter = dateline.split("Tarih: ");
    var date = dateStringGetter.last;
    var dateValues = date.split(".");
    var month = int.parse(dateValues[1]);
    var year = int.parse(dateValues.last);
    if (month >= 9 || month <= 2) {
      semester = "Güz $year-${year + 1}";
    }
    if (month >= 3 || month <= 7) {
      semester = "Bahar ${year - 1}-$year";
    }
  }

  Future<void> _getAuthorsData() async {
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].contains("Öğrenci No") &&
          lines[i + 1].contains("Adı Soyadı")) {
        var studentNumberLine = lines[i];
        var nameLine = lines[i + 1];
        var studentNumberGetter = studentNumberLine.split(": ");
        var studentNumber = studentNumberGetter.last;
        var nameGetter = nameLine.split(": ");
        var nameSurname = getNameSurname(nameGetter.last);
        var studentFirstName = nameSurname.first;
        var studentSurname = nameSurname.last;
        Student student = new Student();
        student.id = int.parse(studentNumber);
        student.firstName = studentFirstName;
        student.lastName = studentSurname;
        if (studentNumber[5] == "1") {
          student.educationType = EducationType.birinciOgretim;
        } else {
          student.educationType = EducationType.ikinciOgretim;
        }
        studentList.add(student);
        if (studentList.length == authors.length) {
          break;
        }
      }
    }
    print("-------------------------- Authors test--------------------");

    for (Student student in studentList) {
      print(student.id);
      print(student.firstName);
      print(student.lastName);
      print(student.educationType);
      print("");
    }
  }

  Future<void> _getSummary() async {
    String summary = "";
    for (int i = 0; i < lines.length; i++) {
      if (lines[i] == "ÖZET") {
        for (int j = i + 1; j < lines.length; j++) {
          summary = summary + lines[j];
          if (lines[j + 1].contains("Anahtar") &&
              (lines[j + 1].contains("kelimeler:"))) {
            this.summary = summary;
            lineData.keyWordsLine = j + 1;
            break;
          }
        }
      }
    }
  }

  Future<void> _getKeywords() async {
    String keywordsString = "";
    for (int i = lineData.keyWordsLine; i < lines.length; i++) {
      keywordsString = keywordsString + lines[i];
      if (lines[i + 1].contains(".")) {
        keywordsString = keywordsString + " " + lines[i + 1];
        break;
      }
    }
    var keywordsExtractor = keywordsString.split("kelimeler:");
    var unformattedKeywords = keywordsExtractor.last.split(",");
    List<String> formattedKeywords = [];

    for (String keyword in unformattedKeywords) {
      if (keyword != unformattedKeywords.last) {
        formattedKeywords.add(keyword.trimLeft());
      }

      if (keyword == unformattedKeywords.last) {
        formattedKeywords
            .add(keyword.substring(0, keyword.length - 1).trimLeft());
      }
    }
    this.keywords = formattedKeywords;
  }
}

List<String> getNameSurname(String name) {
  var extractor = name.split(" ");
  if (extractor.length == 2) {
    return [extractor.first.trimLeft(), extractor.last.trimLeft()];
  } else {
    var firstname = "";
    for (int i = 0; i < extractor.length - 1; i++) {
      firstname = firstname + " " + extractor[i];
    }
    var lastName = extractor.last;

    var finalNameList = [firstname.trimLeft(), lastName.trimLeft()];
    return finalNameList;
  }
}

// helper class to store the line number that contains a specific value

class LineData {
  int projectTypeLine;
  int titleLine;
  int authorsLine;
  int counselorLine;
  int firstJuriLine;
  int secondJuriLine;
  int semesterLine;
  int keyWordsLine;

  LineData(
    this.projectTypeLine,
    this.titleLine,
    this.authorsLine,
    this.counselorLine,
    this.firstJuriLine,
    this.secondJuriLine,
    this.semesterLine,
    this.keyWordsLine,
  );
}
