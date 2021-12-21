import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PdfView extends StatefulWidget {
  final String documentName;
  final String documentUD;
  PdfView(this.documentName, this.documentUD);

  @override
  _PdfViewState createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth / 4,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.insert_drive_file,
                color: Colors.black38,
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.documentName,
                style: GoogleFonts.ubuntu(fontSize: 16, color: Colors.black38),
              ),
            ],
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            child: Icon(
              Icons.remove_red_eye,
              color: Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }
}
