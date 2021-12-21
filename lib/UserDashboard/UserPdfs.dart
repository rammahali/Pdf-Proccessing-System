import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project3/Widgets/PdfView.dart';

class UserPdfs extends StatefulWidget {
  final ValueNotifier<int> index;
  UserPdfs(this.index);

  @override
  _UserPdfsState createState() => _UserPdfsState();
}

class _UserPdfsState extends State<UserPdfs> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      children: [
        Row(
          children: [
            InkWell(
                onTap: () {widget.index.value=0;},
                child: Icon(Icons.arrow_back_sharp,color: Colors.blueGrey,size: 30,)),
            SizedBox(width: 10,),
            Text(
              "Your uploaded pdf files",
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
        ListView(
          shrinkWrap: true,
          children: [
            Row(
              children: [
                PdfView("Rammah's pdf", "1"),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                PdfView("ali's pdf", "2"),
              ],
            ),
          ],
        )
      ],
    );
  }
}
