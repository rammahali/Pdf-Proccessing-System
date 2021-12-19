import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminHome extends StatefulWidget {
  ValueNotifier<int> index;
  AdminHome(this.index);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),

      children: [
        Row(
          children: [
            Text(
              "Hi Rammah ,",
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
              padding: EdgeInsets.symmetric(
                  horizontal: 13, vertical: 30),
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
                        Icons.date_range,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Search Pdf by semester",
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
                            "View all the pdf files uploaded in specific semester",
                            style: TextStyle(
                                color: Colors.white, fontSize: 15),
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
                        onTap: (){widget.index.value=1;},
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(15)),
                          child: Text(
                            "Search",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: 20,),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 13, vertical: 30),
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.purple,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.assignment_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Search pdf by data",
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
                            "Use specific details to pick certain pdf file such as writer name , or student numbers , etc",
                            style: TextStyle(
                                color: Colors.white, fontSize: 15),
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
                        onTap: (){widget.index.value=2;},
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(15)),
                          child: Text(
                            "Seacrh",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
