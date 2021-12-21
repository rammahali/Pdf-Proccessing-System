import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SemesterSearch extends StatefulWidget {
  final ValueNotifier<int> index;
  SemesterSearch(this.index);

  @override
  _SemesterSearchState createState() => _SemesterSearchState();
}

class _SemesterSearchState extends State<SemesterSearch> {
  var ListContainerColor = const Color(0xffC1E1C1);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                  onTap: () {
                    widget.index.value = 0;
                  },
                  child: Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.blueGrey,
                    size: 30,
                  )),
              SizedBox(
                width: 10,
              ),
              Text(
                "Search file by semester",
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
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
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
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: screenWidth / 3.5,
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
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        "Search",
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  decoration: BoxDecoration(
                      color: this.ListContainerColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: DataTable(columns: [
                    DataColumn(
                        label: Row(
                      children: [
                        Icon(
                          Icons.account_box_rounded,
                          size: 25,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text("Author",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 17)),
                      ],
                    )),
                    DataColumn(
                        label: Row(
                      children: [
                        Icon(
                          Icons.assignment_rounded,
                          size: 25,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text("Title",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 17)),
                      ],
                    )),
                    DataColumn(
                        label: Row(
                      children: [
                        Icon(
                          Icons.apps_sharp,
                          size: 25,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text("Type",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 17)),
                      ],
                    )),
                    DataColumn(
                      label: Row(
                        children: [
                          Icon(
                            Icons.date_range,
                            size: 25,
                            color: Colors.black54,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Semester",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 17)),
                        ],
                      ),
                    ),
                    DataColumn(
                      label: Row(
                        children: [
                          Icon(
                            Icons.all_inclusive_sharp,
                            size: 25,
                            color: Colors.black54,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Keywords",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 17)),
                        ],
                      ),
                    ),
                  ], rows: [
                    DataRow(onSelectChanged: (selected) {}, cells: [
                      DataCell(
                        Text(
                          "Rammah ali mustafa",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      DataCell(
                        Text(
                          "Pdf processing system",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      DataCell(
                        Text(
                          "Bittirme projesi",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      DataCell(
                        Text(
                          "Guz 2020-2021",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      DataCell(
                        Text(
                          "Pdf,data , users, processing,",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ]),
                  ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
