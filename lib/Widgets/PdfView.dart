import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class PdfView extends StatefulWidget {
 String documentName;
 String documentUD;
 PdfView(this.documentName,this.documentUD);

  @override
  _PdfViewState createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      decoration: BoxDecoration( color: Colors.grey.shade300, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Row(
             children: [
               Container(height:45 ,width:45,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/pdf.png"), fit:BoxFit.fitHeight)),),
               SizedBox(width: 10,),
               Text(widget.documentName,style: GoogleFonts.ubuntu(fontSize: 18,color: Colors.black),),
             ],
           ),
          Container(
            height: 60,width: 60, decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.indigo),
            child: Icon(Icons.remove_red_eye,color: Colors.white,),
          ),
        ],
      ),
    );
  }
}
