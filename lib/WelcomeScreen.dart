import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key, this.toggleScreen}) : super(key: key);

  final Function toggleScreen;

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 450,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/1.jpeg"))),
              ),
              Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Container(
                height: 80,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Food for Everyone!",
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                    // Text("To get Started",
                    //     style: TextStyle(fontSize: 18, color: Colors.black)),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text("GET STARTED"),
                      onPressed: isLoading
                          ? null
                          : () {
                              Navigator.of(context)
                                  .pushReplacementNamed('auth');
                            },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.orange[200],
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          textStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  // Row(children: <Widget>[
                  //   Text("Do you Already have an Account!"),
                  //   TextButton(
                  //       child: Text("Log In"),
                  //       onPressed: isLoading
                  //           ? null
                  //           : () {
                  //                Navigator.of(context).pushReplacementNamed('auth');
                  //             }),
                  // ]),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
