import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:final_project/Services/AuthService.dart';

import 'HomePage.dart';
import 'RegisterScreen.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({Key key, this.toggleScreen}) : super(key: key);

  final Function toggleScreen;

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  AuthService _authService = AuthService();

  String email;
  String password;
  bool obserText = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[200],
        title: Text("LOG IN", style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        color: Colors.white,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Image(
                image: AssetImage("assets/images/logo.jpeg"),
                width: 250,
                height: 250,
              ),
              Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        enabled: !isLoading,
                        decoration: InputDecoration(
                            hintText: "Example@gmail.com",
                            labelText: "Email",
                            fillColor: Colors.lightGreen,
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                            )),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Email is required";
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return "This value is not a valid email address";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                          enabled: !isLoading,
                          obscureText: obserText,
                          decoration: InputDecoration(
                            hintText: "********",
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    obserText = !obserText;
                                  });
                                  FocusScope.of(context).unfocus();
                                },
                                child: Icon(
                                  Icons.visibility,
                                  color: Colors.black,
                                )),
                            labelText: "Password",
                            fillColor: Colors.lightGreen,
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Password is required";
                            }
                            if (value.length < 8) {
                              return "Password should be more than 8 characters";
                            }

                            RegExp hasUpper = RegExp(r'[A-Z]');
                            RegExp hasLower = RegExp(r'[a-z]');
                            RegExp hasDigit = RegExp(r'\d');
                            RegExp hasPunct = RegExp(r'[_!@#\$&*~-]');

                            if (!hasUpper.hasMatch(value))
                              return 'Password must have at least one uppercase character';
                            if (!hasLower.hasMatch(value))
                              return 'Password must have at least one lowercase character';
                            if (!hasDigit.hasMatch(value))
                              return 'Password must have at least one number';
                            if (!hasPunct.hasMatch(value))
                              return 'Passwordd need at least one special character like !@#\$&*~-';

                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          }),
                    ],
                  )),
              SizedBox(
                height: 15,
              ),
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Container(),
              ElevatedButton.icon(
                icon: Icon(Icons.login, color: Colors.black),
                label: Text(
                  "Log in",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: isLoading
                    ? null
                    : () {
                        if (formkey.currentState.validate()) {
                          print("You can log in");

                          setState(() {
                            isLoading = true;
                          });

                          var userObj = _authService.loginUser(email, password);
                          if (userObj != null) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (ctx) => HomePage()));
                          }
                        } else {
                          print("You cannot log in");
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange[200],
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    textStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              Row(children: <Widget>[
                Text("Don't Have an Account?"),
                TextButton(
                  child: Text("Sign up here"),
                  onPressed: isLoading
                      ? null
                      : () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (ctx) => RegisterScreen()));
                        },
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
