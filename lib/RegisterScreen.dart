import 'package:final_project/HomePage.dart';
import 'package:final_project/LogInScreen.dart';
import 'package:flutter/material.dart';
import 'package:final_project/Services/AuthService.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key, this.toggleScreen}) : super(key: key);

  final Function toggleScreen;

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  AuthService _authService = AuthService();

  String _password;
  String _email;
  String _fname;
  String _laname;
  bool _didAgree = false;
  bool obserText = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange[200],
          title: Text('Register', style: TextStyle(color: Colors.black))),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        enabled: !isLoading,
                        decoration: InputDecoration(
                          hintText: "First Name",
                          labelText: "First Name",
                          fillColor: Colors.lightGreen,
                          border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "First Name is required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        enabled: !isLoading,
                        decoration: InputDecoration(
                          hintText: "Last Name",
                          labelText: "Last Name",
                          fillColor: Colors.lightGreen,
                          border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Last Name is required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        enabled: !isLoading,
                        decoration: InputDecoration(
                          hintText: "example@gmail.com",
                          labelText: "Email",
                          fillColor: Colors.lightGreen,
                          border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
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
                      ),
                      SizedBox(
                        height: 10,
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
                            _password = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        enabled: !isLoading,
                        decoration: InputDecoration(
                            hintText: "*******",
                            labelText: "Confirm Password",
                            fillColor: Colors.lightGreen,
                            // properties related to border
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                            )),
                        obscureText: true,
                        validator: (value) {
                          if (value != _password) {
                            return "Password should match!";
                          }
                          return null;
                        },
                        // Confirm password
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              FormField(
                initialValue: _didAgree,
                builder: (FormFieldState<bool> state) {
                  return Column(
                    // Checkbox and text that says "I agree to the terms" they are arranged horizontally
                    // so we wrap them inside a row
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              // the value of the form state is given here, instead of the bool variable we initialized above
                              value: state.value,
                              // this function will trigger every time the user clicks the checkbox
                              onChanged: (val) {
                                _didAgree = val;
                                state.didChange(
                                    val); // this function will also update this form's state value
                              }),
                          Text("I agree to the terms.")
                        ],
                      ),

                      // Check if there is an error, the user forgot to check the box
                      // this errorText is available because it is a form field
                      // just like the TextFormFields
                      state.errorText == null
                          ? Text("")
                          : Text(state.errorText,
                              style: TextStyle(color: Colors.red))
                    ],
                  );
                },
                validator: (value) {
                  if (!value) {
                    return "You must agree before signing up";
                  }
                  return null;
                },
              ),
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Container(),
              ElevatedButton.icon(
                icon: Icon(Icons.app_registration, color: Colors.black),
                label: Text("Register", style: TextStyle(color: Colors.black)),
                onPressed: isLoading
                    ? null
                    : () {
                        if (formkey.currentState.validate()) {
                          print("User can register");
                          setState(() {
                            isLoading = true;
                          });
                          var userObj = _authService.registerUser(
                              _email, _password, _fname, _laname);
                          if (userObj != null) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (ctx) => HomePage()));
                          }
                        } else {
                          print("User cannot register");
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
                Text("I Have Already An Account!"),
                TextButton(
                    child: Text("Log In"),
                    onPressed: isLoading
                        ? null
                        : () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (ctx) => LogInScreen()));
                          }),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
