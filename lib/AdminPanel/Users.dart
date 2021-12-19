import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Users extends StatefulWidget {
  ValueNotifier<int> index;
  Users(this.index);

  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  var ListContainerColor = const Color(0xffC1E1C1);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40,vertical: 40),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                  onTap: () {widget.index.value=0;},
                  child: Icon(Icons.arrow_back_sharp,color: Colors.blueGrey,size: 30,)),
              SizedBox(width: 10,),
              Text(
                "Users",
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

          SizedBox(height: 10,),
           Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               Material(
                 color: Colors.transparent,
                 child: InkWell(
                   onTap: (){addUserSheet(screenWidth);},
                   child: Container(
                     alignment: Alignment.center, padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                     height: 70, width: 180,
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(12),
                     ),
                     child: Row(
                       children: [
                         Icon(Icons.add_circle_sharp,color: Colors.black54,),
                         SizedBox(width: 10,),
                         Text("Add new user",style: TextStyle(color: Colors.black54,fontSize: 16),),
                       ],
                     ),
                   ),
                 ),
               ),
             ],
           ),
          SizedBox(height: 20,),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                  decoration: BoxDecoration(color: this.ListContainerColor,borderRadius: BorderRadius.circular(15)),
                  child: DataTable(
                      columns: [
                        DataColumn(
                            label:
                            Row(
                              children: [
                                Icon(Icons.account_box_rounded,size: 25,color: Colors.black54,),
                                SizedBox(width: 7,),
                                Text("Name",style: TextStyle(color: Colors.black54,fontSize: 17)),
                              ],
                            )
                        ),
                        DataColumn(
                            label:
                            Row(
                              children: [
                                Icon(Icons.assignment_rounded,size: 25,color: Colors.black54,),
                                SizedBox(width: 7,),
                                Text("Email",style: TextStyle(color: Colors.black54,fontSize: 17)),
                              ],
                            )
                        ),
                      ],
                      rows: [
                        DataRow(
                            onSelectChanged: (selected){
                              editUserSheet(screenWidth);
                            },
                            cells: [
                              DataCell(
                                Text("Rammah ali mustafa",style: TextStyle(color: Colors.black54),),
                              ),
                              DataCell(
                                Text("Rammmah@gmail.com",style: TextStyle(color: Colors.black54),),
                              ),
                            ]),


                      ]
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

   editUserSheet(double screenWidth){
    return showModalBottomSheet(
        context: context,
        builder:(context){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: 400,
            child: ListView(children: [
              SizedBox(height: 50,),
              Text("Rammah Ali Mustafa", style: GoogleFonts.ubuntu(color: Colors.black54,fontSize: 28),),
              SizedBox(height: 30,),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 65, width:  screenWidth/3.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.black26,
                    ),
                    child: TextField(
                      style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 20),
                      decoration: InputDecoration(
                        label: Text("Name", style: TextStyle(color: Colors.white,fontSize: 18),),
                        hintText: "Name" ,
                        hintStyle: TextStyle(fontSize: 14, color: Colors.white70),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 65, width:  screenWidth/3.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.black26,
                    ),
                    child: TextField(
                      style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 20),
                      decoration: InputDecoration(
                        label: Text("Email", style: TextStyle(color: Colors.white,fontSize: 18),),
                        hintText: "Email" ,
                        hintStyle: TextStyle(fontSize: 14, color: Colors.white70),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 65, width:  screenWidth/3.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.black26,
                    ),
                    child: TextField(
                      obscureText: true,
                      style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 20),
                      decoration: InputDecoration(
                        label: Text("Password", style: TextStyle(color: Colors.white,fontSize: 18),),
                         hintText: "Password" ,
                        hintStyle: TextStyle(fontSize: 14, color: Colors.white70),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 120,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        alignment: Alignment.center, padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        height: 70, width: 180,
                        decoration: BoxDecoration(
                          color: Color(0xffC1E1C1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.refresh,color: Colors.black54,),
                            SizedBox(width: 10,),
                            Text("Update",style: TextStyle(color: Colors.black54,fontSize: 16),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        alignment: Alignment.center, padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        height: 70, width: 180,
                        decoration: BoxDecoration(
                          color:  Color(0xffFF7F7F),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.auto_delete,color: Colors.black54,),
                            SizedBox(width: 10,),
                            Text("Delete",style: TextStyle(color: Colors.black54,fontSize: 16),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],),
          );
        }
    );
  }
  addUserSheet(double screenWidth){
    return showModalBottomSheet(
        context: context,
        builder:(context){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: 400,
            child: ListView(children: [
              SizedBox(height: 50,),
              Text("Add a new user", style: GoogleFonts.ubuntu(color: Colors.black54,fontSize: 28),),
              SizedBox(height: 30,),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 65, width:  screenWidth/3.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.black26,
                    ),
                    child: TextField(
                      style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 20),
                      decoration: InputDecoration(
                        label: Text("Name", style: TextStyle(color: Colors.white,fontSize: 18),),
                        hintText: "Name" ,
                        hintStyle: TextStyle(fontSize: 14, color: Colors.white70),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 65, width:  screenWidth/3.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.black26,
                    ),
                    child: TextField(
                      style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 20),
                      decoration: InputDecoration(
                        label: Text("Email", style: TextStyle(color: Colors.white,fontSize: 18),),
                        hintText: "Email" ,
                        hintStyle: TextStyle(fontSize: 14, color: Colors.white70),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 65, width:  screenWidth/3.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.black26,
                    ),
                    child: TextField(
                      obscureText: true,
                      style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 20),
                      decoration: InputDecoration(
                        label: Text("Password", style: TextStyle(color: Colors.white,fontSize: 18),),
                        hintText: "Password" ,
                        hintStyle: TextStyle(fontSize: 14, color: Colors.white70),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 120,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        alignment: Alignment.center, padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        height: 70, width: 180,
                        decoration: BoxDecoration(
                          color: Color(0xffC1E1C1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.add_circle_sharp,color: Colors.black54,),
                            SizedBox(width: 10,),
                            Text("Add",style: TextStyle(color: Colors.black54,fontSize: 16),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],),
          );
        }
    );
  }
}
