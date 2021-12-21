import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project3/UserDashboard/HomePage.dart';
import 'package:project3/UserDashboard/UploadPage.dart';
import 'package:project3/UserDashboard/UserPdfs.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  final ValueNotifier<int> index = new ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade200,
        body: Center(
          child: Container(
            height: screenHeight - 70,
            width: screenWidth - 100,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Container(
                  height: double.infinity,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          topLeft: Radius.circular(12))),
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    shrinkWrap: true,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/kou.png"),
                                    fit: BoxFit.fitHeight)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "KOÜ",
                            style: GoogleFonts.aBeeZee(
                                color: Colors.blueGrey, fontSize: 25),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 75,
                        width: 180,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.home,
                              color: Colors.black54,
                              size: 25,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "Home",
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black54, fontSize: 17),
                            )
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 75,
                        width: 180,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.settings,
                              color: Colors.black54,
                              size: 25,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "Account settings",
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black54, fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 75,
                        width: 180,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.picture_as_pdf,
                              color: Colors.black54,
                              size: 25,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "PDF sample",
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black54, fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: screenWidth - 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(12),
                          topRight: Radius.circular(12))),
                  child: ValueListenableBuilder(
                      valueListenable: index,
                      builder: (context, value, child) {
                        if (index.value == 0) return HomePage(index);
                        if (index.value == 1)
                          return UploadPage(index);
                        else if (index.value == 2)
                          return UserPdfs(index);
                        else
                          return HomePage(index);
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
