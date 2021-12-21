import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project3/Processor/Processor.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class UploadPage extends StatefulWidget {
  final ValueNotifier<int> index;

  UploadPage(this.index);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  String pdfName = "";
  bool pdfSelected = false;
  bool picking = false;
  late FilePickerResult filePickerResult;
  bool processing= false;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return processing ?Container(
      child: Center(child: Text("Processing the pdf file",style: TextStyle(color: Colors.black54,fontSize: 18),),),
    ):ListView(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      children: [
        Row(
          children: [
            InkWell(
                onTap: () {
                  widget.index.value = 0;
                },
                child: Icon(
                  Icons.arrow_back_sharp,
                  color: Colors.blueGrey,
                  size: 30,
                )),
            SizedBox(
              width: 10,
            ),
            Text(
              "Upload Pdf file",
              style: GoogleFonts.ubuntu(
                  color: Colors.black54,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 13, vertical: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.deepPurple,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.warning,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Warning",
                    style:
                        GoogleFonts.aBeeZee(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Flexible(
                      child: Text(
                    "When uploading a new PDF make sure it matches the Kocaeli University's format so our system should be able to extract the important data and save it so you can view the data at later time , when uploading a pdf it may take a while because the system will upload the file then extract the data.",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Text(
              "Give it a name",
              style: GoogleFonts.ubuntu(
                color: Colors.black54,
                fontSize: 18,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 65,
              width: screenWidth / 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.black26,
              ),
              child: TextField(
                style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  hintText: "Pdf name",
                  hintStyle: TextStyle(fontSize: 20, color: Colors.white70),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              "Select a pdf",
              style: GoogleFonts.ubuntu(
                color: Colors.black54,
                fontSize: 18,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        pdfSelected
            ? pdfObject(pdfName)
            : Row(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => pickPDF(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          picking
                              ? Container(
                                  height: 50,
                                  width: 50,
                                  child: CircularProgressIndicator(
                                    color: Colors.black,
                                  ),
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                  ),
                                  child: Text(
                                    "Upload",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ],
    );
  }

  Widget pdfObject(String pdfName) {
    return Row(
      children: [
        Container(
          width: 300,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.orange, borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          pdfSelected = false;
                        });
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20,
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.insert_drive_file,
                    size: 30,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8),
                  Text(
                    pdfName,
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap:extractText,
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        "Upload",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }


  Future<void> extractText() async {
    print("Extracting text........");
    //Load an existing PDF document.
    PdfDocument document =
    PdfDocument(inputBytes:filePickerResult.files.single.bytes);

//Create a new instance of the PdfTextExtractor.
    PdfTextExtractor extractor = PdfTextExtractor(document);

    print("Extracted text is :");

//Extract all the text from the document.
    String text = extractor.extractText(layoutText: true);

    Processor processor = new Processor(text);
    processor.processText();
  }

  Future<List<int>> _readDocumentData(String name) async {
    final ByteData data = await rootBundle.load('assets/$name');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  Future<void> pickPDF() async {
    setState(() {
      picking = true;
    });
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        dialogTitle: "Please select a pdf file", type: FileType.media);
    if (result != null) {
      String fileName = result.files.first.name;
      pdfName = fileName;
      filePickerResult = result;
      setState(() {
        pdfSelected = true;
        picking = false;
      });
    } else {
      setState(() {
        picking = false;
        pdfSelected = false;
      });
    }
  }
}
