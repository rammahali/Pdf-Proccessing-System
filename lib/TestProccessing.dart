import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project3/Processor/Processor.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class TestProcessing extends StatefulWidget {
  const TestProcessing({Key? key}) : super(key: key);

  @override
  _TestProcessingState createState() => _TestProcessingState();
}

class _TestProcessingState extends State<TestProcessing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: (){
            extractText();
          },
          child: Container(
            alignment: Alignment.center,
            width: 100,
            height: 80,
            color: Colors.teal,
            child: Text("Extract text",style: TextStyle(color: Colors.white, fontSize: 16),),
          ),
        ),
      ),
    );
  }

  Future <void> extractText() async{
    print("Extracting text........");
    //Load an existing PDF document.
    PdfDocument document =
    PdfDocument(inputBytes: await _readDocumentData('sample.pdf'));

//Create a new instance of the PdfTextExtractor.
    PdfTextExtractor extractor = PdfTextExtractor(document);

    print("Extracted text is :");

//Extract all the text from the document.
    String text = extractor.extractText(layoutText: true);

    print("Starting text proccessing......");
    Processor processor = new Processor(text);
    processor.processText();
  }

  Future<List<int>> _readDocumentData(String name) async {
    final ByteData data = await rootBundle.load('assets/$name');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }
}
