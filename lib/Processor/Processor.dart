
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
  List<Student> studentList =[];

  // -1 means not detected yet
  LineData lineData = LineData(-1, -1, -1, -1, -1, -1, -1);


  Future<void> processText() async{
    // removing all the unnecessary spacing
    formattedPdfText = pdfString.replaceAll(new RegExp(r'(?:[\t ]*(?:\r?\n|\r))+'), '\n');
     print(formattedPdfText);
    LineSplitter ls = new LineSplitter();
    lines  = ls.convert(formattedPdfText);
      await _getProjectType();
      await _getTitle();
      await _getAuthorsNumber();
      await _getCounselor();
      await _getJuris();
      await _getSemester();
      await _getAuthorsData();

     print("project type is $projectType found on line number : ${lineData.projectTypeLine}");
    print("project title is $projectTitle found on line number : ${lineData.titleLine}");
    print("authors is/are $authors found on line number : ${lineData.authorsLine}");
    print("counselor is $counselor found on line number : ${lineData.counselorLine}");
    print("juris are $juri found on line number : ${lineData.firstJuriLine}");
    print("semester is $semester found on line number : ${lineData.semesterLine}");
    print("student full list is $studentList found on line number : ${lineData.semesterLine}");
  }

  Future <void> _getProjectType() async {
    for(var i =0;i<lines.length;i++) {
      String currentLine = lines[i];
        if(currentLine.contains("ARAŞTIRMA PROBLEMLERİ")|| currentLine.contains("BİTİRME PROJESİ"))
        {
        projectType = currentLine;
        lineData.projectTypeLine=i;
        break;
      }
    }
  }

  Future <void> _getTitle() async{
    // title always comes after the project type as specified on the format
     lineData.titleLine = lineData.projectTypeLine+1;
     projectTitle = lines[lineData.titleLine];
  }

  Future <void> _getAuthorsNumber() async{
    // authors always comes after the project title as specified on the format
     lineData.authorsLine = lineData.titleLine+1;

     String authorsLine = lines[lineData.authorsLine];

     if(authorsLine.contains("-")){
       authors = authorsLine.split("-");
     }

     else {
       authors.add(authorsLine);
     }
  }

  Future <void> _getCounselor() async{
    lineData.counselorLine = lineData.authorsLine+1;
   String counselorLine = lines[lineData.counselorLine];
    var firstSplitter =  counselorLine.split(" Danışman");
    var formedLine = firstSplitter.first;
    var secondSplitter =  formedLine.split(". ");
    counselor = secondSplitter.last;
  }
  Future<void> _getJuris() async {
    lineData.firstJuriLine = lineData.counselorLine+1;
    lineData.secondJuriLine = lineData.firstJuriLine+1;

    var firstJuriLine = lines[lineData.firstJuriLine];
    var secondJuriLine = lines[lineData.secondJuriLine];

    juri.add(extractJuriData(firstJuriLine));
    juri.add(extractJuriData(secondJuriLine));

  }

  String extractJuriData(String juriLine){
    var firstSplitter =  juriLine.split(" Jüri");
    var formedLine = firstSplitter.first;
    var secondSplitter = [];
    if(juriLine.contains(". Üyesi")) {
      secondSplitter =  formedLine.split("Üyesi ");
    }
    else{
      secondSplitter =  formedLine.split(". ");
    }

    var juriName = secondSplitter.last;
    return juriName;
  }

  Future<void> _getSemester() async {
    lineData.semesterLine=lineData.secondJuriLine+1;
    var dateline = lines[lineData.semesterLine];
    var dateStringGetter = dateline.split("Tarih: ");
    var date = dateStringGetter.last;
    var dateValues = date.split(".");
    var month = int.parse(dateValues[1]);
    var year =  int.parse(dateValues.last);
    if(month>=9 || month <=2) {
      semester = "Güz $year-${year+1}";
    }
    if(month>=3 || month <=7) {
      semester = "Bahar ${year-1}-$year";
    }
  }

  Future <void> _getAuthorsData() async {
    for(int i = 0; i<lines.length;i++) {
      if(lines[i].contains("Öğrenci No") && lines[i+1].contains("Adı Soyadı")) {
        var studentNumberLine = lines[i];
        var nameLine = lines[i+1];
        var studentNumberGetter = studentNumberLine.split(": ");
        var studentNumber = studentNumberGetter.last;
        var nameGetter = nameLine.split(": ");
        var nameSurname = getNameSurname(nameGetter.last);
        var studentFirstName =  nameSurname.first;
        var studentSurname = nameSurname.last;
        Student student = new Student();
        student.id = int.parse(studentNumber);
        student.firstName = studentFirstName;
        student.lastName = studentSurname;
        if(studentNumber[5]=="1")
          {
            student.educationType = EducationType.birinciOgretim;
          }
        else {
          student.educationType = EducationType.ikinciOgretim;
        }
        studentList.add(student);
       print("-------------------------------- TEST BROO-----------------------------------");
         print(student.firstName);
        print(student.lastName);
        print(student.id);
        print(student.educationType);
        if(studentList.length == authors.length){
          break;
        }
      }
    }

  }
}


List<String> getNameSurname(String name){
  var extractor = name.split(" ");
  if(extractor.length==2) {
    return extractor;
  }
  else {
    var firstname = "";
    for(int i=0;i<extractor.length-1;i++){
      firstname = firstname+extractor[i];
    }
    var lastName = extractor.last;

    var finalNameList =[firstname,lastName];
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

   LineData(
       this.projectTypeLine,
       this.titleLine,
       this.authorsLine,
       this.counselorLine,
       this.firstJuriLine,
       this.secondJuriLine,
       this.semesterLine,
       );
}

