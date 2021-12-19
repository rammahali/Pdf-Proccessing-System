import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataSeacrh extends StatefulWidget {
  ValueNotifier<int> index;
  DataSeacrh(this.index);

  @override
  _DataSeacrhState createState() => _DataSeacrhState();
}

class _DataSeacrhState extends State<DataSeacrh> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      children: [
        Row(
          children: [
            InkWell(
                onTap: () {widget.index.value=0;},
                child: Icon(Icons.arrow_back_sharp,color: Colors.blueGrey,size: 30,)),
            SizedBox(width: 10,),
            Text(
              "Search file by data",
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

        Row(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Author",
                      style: GoogleFonts.ubuntu(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      width: screenWidth/6,
                      child: DropdownSearch<String>.multiSelection(
                        mode: Mode.MENU,
                        items: ["Rammah Ali mustafa", "Ali Elbashir Mohammed Osman ", "Seed ALrasa Malik ALmanasa", 'Bro min Ombada'],
                        onChanged: print,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(width: 10,),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Title",
                      style: GoogleFonts.ubuntu(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      width: screenWidth/6,
                      child: DropdownSearch<String>.multiSelection(
                        mode: Mode.MENU,
                        items: ["Good stuff", "Bad stuff "],
                        onChanged: print,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(width: 10,),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Type",
                      style: GoogleFonts.ubuntu(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      width: screenWidth/6,
                      child: DropdownSearch<String>.multiSelection(
                        mode: Mode.MENU,
                        items: ["Bittirme projesi", "Arastirma projesi "],
                        onChanged: print,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            SizedBox(width: 10,),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Semester",
                      style: GoogleFonts.ubuntu(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      width: screenWidth/6,
                      child: DropdownSearch<String>.multiSelection(
                        mode: Mode.MENU,
                        items: ["Guz 2000-2001", "Bahar 3400-3401 "],
                        onChanged: print,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(width: 10,),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Keywords",
                      style: GoogleFonts.ubuntu(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      width: screenWidth/6,
                      child: DropdownSearch<String>.multiSelection(
                        mode: Mode.MENU,
                        items: ["Suss", "create ", "good", 'test'],
                        onChanged: print,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 20,),
        DataTable(
            columns: [],
            rows: []
        )
      ],
    );
  }
}
