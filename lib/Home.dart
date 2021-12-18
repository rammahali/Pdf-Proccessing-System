import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                "Welcome back , rammah",
                style: TextStyle(color: Colors.black87, fontSize: 18),
              )
            ],
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
