import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project3/UserData.dart';

class HomePage extends StatefulWidget {
  final ValueNotifier<int> index;

  HomePage(this.index);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      children: [
        Row(
          children: [
            Text(
              "Hi ${UserData.name} ,",
              style: GoogleFonts.ubuntu(
                  color: Colors.black54,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 13, vertical: 30),
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.orange,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.upload_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Upload a new PDF",
                        style: GoogleFonts.aBeeZee(
                            color: Colors.white, fontSize: 20),
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
                        "This sytem is degsined to help the teachers to analayze thier students pdf files , all you need to do is to upload a pdf and the system will extract all the important details",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          widget.index.value = 1;
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            "Upload",
                            style:
                                TextStyle(color: Colors.black87, fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 13, vertical: 30),
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.deepPurple,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.remove_red_eye,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "View Your PDF files",
                        style: GoogleFonts.aBeeZee(
                            color: Colors.white, fontSize: 20),
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
                        "View the PDF files that you have already upload to the system",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          widget.index.value = 2;
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            "View",
                            style:
                                TextStyle(color: Colors.black87, fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
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
              padding: EdgeInsets.symmetric(horizontal: 13, vertical: 30),
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.teal,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.remove_red_eye,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Search your pdf files",
                        style: GoogleFonts.aBeeZee(
                            color: Colors.white, fontSize: 20),
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
                        "Search for certain pdf files you have uploaded using certain data",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          widget.index.value = 2;
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            "View",
                            style:
                                TextStyle(color: Colors.black87, fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
