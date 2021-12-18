import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project3/Widgets/PdfView.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      body: Center(child: Container(height: screenHeight-70,width: screenWidth-100,decoration: BoxDecoration(color: Colors.grey.shade200,borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
             Container(height: double.infinity,width: 300, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12) , topLeft:  Radius.circular(12))),
               child: ListView(
                 padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                 shrinkWrap : true ,children: [
                 Row(children: [Container(height: 70,width: 70, decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/kou.png"),fit: BoxFit.fitHeight)),),
                   SizedBox(width: 10,), 
                   Text("KOÜ" , style: GoogleFonts.aBeeZee(color: Colors.blueGrey,fontSize: 25),)
                 ],),
                 SizedBox(height: 25,),
                 Container(alignment:Alignment.center ,padding :EdgeInsets.symmetric(horizontal: 15),height: 75, width: 180, decoration: BoxDecoration(color: Colors.grey.shade200,borderRadius: BorderRadius.circular(15)),
                   child: Row(children: [
                     Icon(Icons.home,color: Colors.black54, size: 25,),
                     SizedBox(width: 30,),
                     Text("Home", style: GoogleFonts.ubuntu(color: Colors.black54,fontSize: 17),)
                   ],),
                 ),
                 Container(alignment:Alignment.center ,padding :EdgeInsets.symmetric(horizontal: 15),height: 75, width: 180, decoration: BoxDecoration(color: Colors.transparent,borderRadius: BorderRadius.circular(15)),
                   child: Row(children: [
                     Icon(Icons.settings,color: Colors.black54, size: 25,),
                     SizedBox(width: 30,),
                     Text("Account settings", style: GoogleFonts.ubuntu(color: Colors.black54,fontSize: 17),),
                   ],),
                 ),
                 Container(alignment:Alignment.center ,padding :EdgeInsets.symmetric(horizontal: 15),height: 75, width: 180, decoration: BoxDecoration(color: Colors.transparent,borderRadius: BorderRadius.circular(15)),
                   child: Row(children: [
                     Icon(Icons.picture_as_pdf,color: Colors.black54, size: 25,),
                     SizedBox(width: 30,),
                     Text("PDF sample", style: GoogleFonts.ubuntu(color: Colors.black54,fontSize: 17),),
                   ],),
                 ),
               ],),
             ),
            Container(height: double.infinity, width : screenWidth-400 , decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(12) , topRight:  Radius.circular(12))), 
              child: 
              ListView(
                padding: EdgeInsets.symmetric(horizontal: 40 , vertical: 60),
                children:
                [
                  Row( children: [ Text("Hi Rammah ,",style: GoogleFonts.ubuntu(color: Colors.black54,fontSize: 30,fontWeight: FontWeight.bold),)],),
                  SizedBox(height: 30,),
                  Row(children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 13,vertical: 30  ),width: 400, decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.orange,),
                      child: Column(children: [
                        Row(children: [Icon(Icons.upload_rounded,color: Colors.white ,size: 30,), SizedBox(width: 8,), Text("Upload a new PDF",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 20),)],),
                        SizedBox(height: 15,),
                        Row(children: [ Flexible(child: Text("This sytem is degsined to help the teachers to analayze thier students pdf files , all you need to do is to upload a pdf and the system will extract all the important details", style: TextStyle(color: Colors.white,fontSize: 15),))],),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Container(alignment:Alignment.center,height: 40,width: 80,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
                          child: Text("Upload",style: TextStyle(color: Colors.black87,fontSize: 14),),
                        ),],)
                      ],),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 13,vertical: 30  ),width: 400, decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.deepPurple,),
                      child: Column(children: [
                        Row(children: [Icon(Icons.remove_red_eye,color: Colors.white ,size: 30,), SizedBox(width: 8,), Text("View Your PDF files",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 20),)],),
                        SizedBox(height: 15,),
                        Row(children: [ Flexible(child: Text("View the PDF files that you have already upload to the system", style: TextStyle(color: Colors.white,fontSize: 15),))],),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Container(alignment:Alignment.center,height: 40,width: 80,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
                            child: Text("View",style: TextStyle(color: Colors.black87,fontSize: 14),),
                          ),],)
                      ],),
                    ),
                  ],)
                ],
              ),
            )
          ],
        ),
        ),
      )
    );
  }
}
