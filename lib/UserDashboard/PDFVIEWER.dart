import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PDFVIEWER extends StatefulWidget {
  ValueNotifier<int> index;
  PDFVIEWER(this.index);

  @override
  _PDFVIEWERState createState() => _PDFVIEWERState();
}

class _PDFVIEWERState extends State<PDFVIEWER> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return loading?Center(child: Container(height:50,width: 50,child: CircularProgressIndicator(color: Colors.black54,)),)
    :ListView(
      padding: EdgeInsets.symmetric(horizontal: 40,vertical: 40),
      children: [
        Row(
          children: [
            InkWell(
                onTap: () {widget.index.value=0;},
                child: Icon(Icons.arrow_back_sharp,color: Colors.blueGrey,size: 30,)),
            SizedBox(width: 10,),
            Text(
              "Upload Pdf file",
              style: GoogleFonts.ubuntu(
                  color: Colors.black54,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
