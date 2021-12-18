
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';




class PdfViewer extends StatefulWidget {
  const PdfViewer({Key? key}) : super(key: key);

  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  String _text = "Loading file ......";
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {

    var screenWidth =  MediaQuery.of(context).size.width;
    var screenHeight =  MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        children: [
          Container(height: 100, width:  screenWidth, decoration: BoxDecoration(color: Colors.indigo),
            child: Row(
              children: [
                SizedBox(width: 8,),
                Container(child: Icon(Icons.arrow_back_ios, color: Colors.indigo,), decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white), height: 40 , width: 40,),
                SizedBox(width: 8,),
                Text("Pdf name",style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 19),),
              ],
            ),
          ),
          isLoading?Container(height: 5,width: screenWidth,child: LinearProgressIndicator(color: Colors.blue,backgroundColor: Colors.white,),):SizedBox(),
         Expanded(child: Container(
           child: Row(
             children: [
               Container(width: screenWidth/1.5, height:screenHeight ,child: ListView(
                 children: [
                   Text(_text),
                 ],
               ), ),
               Container(color: Colors.yellow,width: screenWidth/3, height: screenHeight, child: ListView(shrinkWrap: true, children: [Text("hi FUUUKKKSKC")],),),
             ],
           ),
         )),
        ],
      ),
    );
  }
  Future _readWholeDoc() async {
//Load an existing PDF document.
    PdfDocument document =
    PdfDocument(inputBytes: await _readDocumentData('pdf_succinctly.pdf'));

//Create a new instance of the PdfTextExtractor.
    PdfTextExtractor extractor = PdfTextExtractor(document);


//Extract all the text from the document.
     _text = extractor.extractText();
     setState(() {
        print(_text);
     });
  }
  Future<List<int>> _readDocumentData(String name) async {
    final ByteData data = await rootBundle.load('assets/sample.pdf');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  @override
  void initState() {
    _readWholeDoc();
    super.initState();
  }
}

