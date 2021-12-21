import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postgrest/postgrest.dart';
import 'package:project3/UserDashboard/UserDashboard.dart';
import 'package:project3/UserData.dart';
import 'package:project3/util/database.dart';

import 'model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool emailFound = false;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.jpg"), fit: BoxFit.fill)),
        child: Center(
            child: emailFound ? finalLoginContainer() : firstLoginContainer()),
      ),
    );
  }

  Widget firstLoginContainer() {
    return Container(
      height: 280,
      width: 450,
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/kou.png"),
                        fit: BoxFit.fitHeight)),
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "Kocaeli University",
                  style: GoogleFonts.ubuntu(
                      fontSize: 18,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Text(
                "Sign in",
                style: TextStyle(color: Colors.black87, fontSize: 24),
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            controller: email,
            decoration: InputDecoration(hintText: "Email address"),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      emailFound = true;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget finalLoginContainer() {
    return Container(
      height: 280,
      width: 450,
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/kou.png"),
                        fit: BoxFit.fitHeight)),
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "Kocaeli Univesrity",
                  style: GoogleFonts.ubuntu(
                      fontSize: 18,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Text(
                "Welcome back !",
                style: TextStyle(color: Colors.black87, fontSize: 18),
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(hintText: "Password"),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap:() async {
                   try{
                    User user =  await login(email.text, password.text, PostgrestClient("http://127.0.0.1:3000"));
                    UserData.id = user.id!;
                    UserData.name = user.name!;
                    showBottomSheet(context: context,
                        builder: (context) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 80, width: MediaQuery.of(context).size.width,
                            color: Colors.green,
                            child: Text("Login successful" , style: TextStyle(color: Colors.white, fontSize: 17),),
                          );
                        });
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => UserDashboard()),
                    );
                   }
                   catch(error){
                     setState(() {
                       emailFound = false;
                     });
                     showBottomSheet(context: context,
                         builder: (context) {
                       return Container(
                         padding: EdgeInsets.symmetric(horizontal: 10),
                         height: 80, width: MediaQuery.of(context).size.width,
                         color: Colors.pink,
                         child: Text("Wrong email or password" , style: TextStyle(color: Colors.white, fontSize: 17),),
                       );
                         });
                   }

                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text(
                      "Sign in",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget createAccountContainer() {
    return Container(
      height: 450,
      width: 450,
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/kou.png"),
                        fit: BoxFit.fitHeight)),
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "Kocaeli Univesrity",
                  style: GoogleFonts.ubuntu(
                      fontSize: 18,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Text(
                "Create account",
                style: TextStyle(color: Colors.black87, fontSize: 24),
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            decoration: InputDecoration(hintText: "Name"),
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            decoration: InputDecoration(hintText: "Email address"),
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(hintText: "Password"),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: null,
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
