import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postgrest/postgrest.dart';
import 'package:project3/model.dart';
import 'package:project3/util/database.dart';

class DataSeacrh extends StatefulWidget {
  final ValueNotifier<int> index;

  DataSeacrh(this.index);

  @override
  _DataSeacrhState createState() => _DataSeacrhState();
}

class _DataSeacrhState extends State<DataSeacrh> {
  List<String> authors = [];
  Project projectQuery = Project();

  List projects = [];

  List<DataRow> tableRows = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    () async {
      final _db = PostgrestClient('http://127.0.0.1:3000');
      final students = await _db.from('student').select('id').execute();
      if (students.hasError) {
        throw Exception("Can't obtain students");
      }
      for (var student in students.data) {
        authors.add(student['id'].toString());
      }
    }();
  }

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
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: screenWidth / 6,
                        child: DropdownSearch<String>.multiSelection(
                          mode: Mode.MENU,
                          items: authors,
                          onChanged: (values) {
                            final newAuthors = <Student>[];
                            for (var value in values) {
                              newAuthors.add(Student(id: int.parse(value)));
                            }
                            projectQuery.authors = newAuthors;
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: 10,
              ),
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
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: screenWidth / 6,
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
              SizedBox(
                width: 10,
              ),
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
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: screenWidth / 6,
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
                        width: screenWidth / 6,
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
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: screenWidth / 6,
                        child: DropdownSearch<String>.multiSelection(
                          mode: Mode.MENU,
                          items: ["Suss", "create ", "good", 'test'],
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
                    onTap: () async {
                      final db = PostgrestClient('http://127.0.0.1:3000');
                      projects = await getProjects(db, projectQuery);
                      var rows = projects.map((project) {
                        var row = DataRow(cells: [
                          DataCell(Text(project['authors'].map((author) => author['first_name'] + ' ' +  author['last_name']).join(', '))),
                          DataCell(Text(project['title'])),
                          DataCell(Text(project['course'])),
                          DataCell(Text(project['submission_date'])),
                          DataCell(Text
                            (project['keywords'].map((keyword) => keyword['keyword']).join(', ')
                          )),
                        ]);
                        return row;
                      }).toList();

                      setState(() {
                        tableRows = rows;
                      });
                    },
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
                  ], rows: tableRows),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
