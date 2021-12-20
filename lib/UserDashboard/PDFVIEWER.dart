import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFVIEWER extends StatefulWidget {
  const PDFVIEWER({Key? key}) : super(key: key);

  @override
  _PDFVIEWERState createState() => _PDFVIEWERState();
}

class _PDFVIEWERState extends State<PDFVIEWER> {
  String summary = "Bu çalışmanın amacı, iletim hatlarında arıza yeri tespiti için empedansa dayalı algoritmaları incelemek ve seri kompanze edilmiş hatlar için yeni bir algoritma geliştirmektir. Öncelikle, tek yada iki baradan alınan ölçümleri kullanarak arıza yerini belirleyen temelalgoritmalar tanımlanmıştır. Örnek test sistemleri üzerinde sistem ve arızaya ilişkinparametreler değiştirilerek, temel arıza yeri algoritmalarından elde edilen sonuçlarkarşılaştırılmıştır. Sistem parametreleri hat modeli ve sistemin homojen olup olmamadurumlarını kapsarken, arızaya ilişkin parametreler arıza tipi, konumu ve direnci olarakalınmıştır.Seri kompanze edilmiş iletim hatlarında empedansa dayalı geliştirilmiş temel algoritmalarınyeterli olmadığı, bu duruma özel algoritmaların gerekliliği bir uygulama ile gösterilmiştir. Buözel algoritmalar incelenerek kısaca özetlenmiştir. Buradan hareketle, iletim hatlarında serikompanzasyon durumunu dikkate alan performansa dayalı yeni bir arıza yeri tespiti algoritmasıbu tez kapsamında geliştirilmiştir.Geliştirilen bu algoritma, hat bilgileri ve iki baradan alınan ölçümleri kullanarak iteratif olarakarıza yerini hesaplayan, bütün örneklerdeki sonuçları karşılaştırarak minimum hata ile birsonuca ulaşan bir algoritmadır. Önerilen algoritma, hem temel algoritmalar hem de seri";

  @override
  Widget build(BuildContext context) {
    var screenWidth= MediaQuery.of(context).size.width;
    var screenHeight= MediaQuery.of(context).size.height;
    var pdfViewerWidth = screenWidth/2.9;
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 80, width: screenWidth,
            decoration: BoxDecoration(color: Colors.grey.shade200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.insert_drive_file,size: 30,color: Colors.black54,),
                    SizedBox(width: 10,),
                    Text("Rammah's pdf", style: TextStyle(color: Colors.black54,fontSize: 18),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                          alignment: Alignment.center, padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          height: 50, width: 180,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.download,color: Colors.black54,),
                              SizedBox(width: 10,),
                              Text("Download file",style: TextStyle(color: Colors.black54,fontSize: 14),),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 15,),

                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                          alignment: Alignment.center, padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          height: 50, width: 180,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.close,color: Colors.black54,),
                              SizedBox(width: 10,),
                              Text("Exit viewer",style: TextStyle(color: Colors.black54,fontSize: 14),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            width: screenWidth,
            height: screenHeight-100,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Container(
                    height: screenHeight-140,
                    width: pdfViewerWidth,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: SfPdfViewer.asset(
                        'sample.pdf') ,
                  ),
                ),
                SizedBox(width: 30,),
                Container(
                  height: double.infinity,
                  width: screenWidth-pdfViewerWidth-30,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          cardWidget(Icons.account_box_rounded, Colors.white, Colors.deepPurple, "Author", "Rammah ali mustafa"),
                          SizedBox(width: 15,),
                          cardWidget(Icons.assignment_rounded, Colors.white, Colors.deepOrange, "Title", "Pdf proccessing system"),
                          SizedBox(width: 15,),
                          cardWidget(Icons.apps_sharp, Colors.white, Colors.pink, "Type", "Bittirme projesi"),
                        ],
                      ),
                      SizedBox(height: 20,),
                    Row(
                      children: [
                        cardWidget(Icons.date_range, Colors.white, Colors.indigo, "Semester", "Winter 2020-2021"),
                        SizedBox(width: 15,),
                        cardWidget(Icons.all_inclusive_sharp, Colors.white, Colors.green, "Keywords", "Pdf , data , processing ,Kocaeli , system"),
                      ],
                    ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          summaryWidget(Icons.add_link, Colors.white, Colors.teal, "Summary", summary),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget cardWidget(IconData icon, Color themeColor, Color backgroundColor, String title, String text){
    var screenWidth = MediaQuery.of(context).size.width;
    return  Container(
      padding: EdgeInsets.symmetric(
          horizontal: 13, vertical: 30),
      width: screenWidth/5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: themeColor,
                size: 30,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                title,
                style: GoogleFonts.aBeeZee(
                    color: themeColor, fontSize: 20),
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
                   text,
                    style: TextStyle(
                        color: Colors.white, fontSize: 15),
                  ))
            ],
          ),

        ],
      ),
    );
  }

  Widget summaryWidget(IconData icon, Color themeColor, Color backgroundColor, String title, String text){
    var screenWidth = MediaQuery.of(context).size.width;
    return  Container(
      padding: EdgeInsets.symmetric(
          horizontal: 13, vertical: 30),
      width: screenWidth/2.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: themeColor,
                size: 30,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                title,
                style: GoogleFonts.aBeeZee(
                    color: themeColor, fontSize: 20),
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
                    text,
                    style: TextStyle(
                        color: Colors.white, fontSize: 15),
                  ))
            ],
          ),

        ],
      ),
    );
  }
}
