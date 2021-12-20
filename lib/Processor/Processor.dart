
class Processor {
  String pdfString;
  Processor(this.pdfString);

  late final String projectType;
  late final String counselorName;
  late final String semester;
  late final String summary;
  var authors = [];
  var juri = [];
  var keywords = [];
  Future<void> processText() async{
    await getProjectType();
    print(projectType);
  }

  Future <void> getProjectType() async {
    String smallCapsBitirme = "Bitirme Projesi";
    String bigCapsBitirme = "BITIRME PROJESI";
    if(this.pdfString.contains(smallCapsBitirme)|| this.pdfString.contains(bigCapsBitirme)) {
      projectType = "Bitirme Projesi";
    }
    else{
      projectType = "Araştırma Problemi";
    }
  }

  Future <void> getAuthors() async{

  }
}