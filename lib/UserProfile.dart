import 'package:final_project/HomePage.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Widget _buildSingleContainer({String startName, String endName}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              startName,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              endName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField({String name}) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: name,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }

  bool edit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          title: Text("User Profile", style: TextStyle(color: Colors.black)),
          leading: edit == true
              ? IconButton(
                  icon: Icon(Icons.close, color: Colors.black),
                  onPressed: () {
                    setState(() {
                      edit = false;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => HomePage()));
                    });
                  },
                ),
          actions: [
            edit == true
                ? IconButton(
                    icon: Icon(Icons.check, color: Colors.black),
                    onPressed: () {
                      setState(() {
                        edit = false;
                      });
                    },
                  )
                : Container()
          ]),
      body: Container(
        //  height: 300,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  // color: Colors.orange[200],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        maxRadius: 70,
                        backgroundColor: Colors.orange[200],
                        // child: Icon(Icons.account_circle,),
                        //backgroundImage: AssetImage("assets/images/user.jpg"),
                      ),
                    ],
                  ),
                ),
                edit == true
                    ? Padding(
                        padding: const EdgeInsets.only(left: 225, top: 100),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Icon(Icons.edit, color: Colors.black),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
            Container(
              // height: 300,
              width: double.infinity,
              // color: Colors.orange[200],
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      //height: 300,
                      width: double.infinity,
                      child: edit == true
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildFormField(name: "Juan de la Cruz"),
                                SizedBox(height: 10),
                                _buildFormField(name: "juandelacruz@gmail.com"),
                                SizedBox(height: 10),
                                _buildFormField(name: "09451305901"),
                                SizedBox(height: 10),
                                _buildFormField(
                                    name:
                                        "Gen. Luna Street, LaPaz, Iloilo City"),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildSingleContainer(
                                  startName: "Name",
                                  endName: "Juan de la Cruz",
                                ),
                                _buildSingleContainer(
                                  startName: "Email",
                                  endName: "juandelacruz@gmail.com",
                                ),
                                _buildSingleContainer(
                                  startName: "Phone Number",
                                  endName: "09451305901",
                                ),
                                _buildSingleContainer(
                                  startName: "Address",
                                  endName:
                                      "Gen.Luna Street, LaPaz, Iloilo City",
                                ),
                              ],
                            ),
                    ),
                  ]),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Container(
                width: 200,
                child: edit == false
                    ? ElevatedButton(
                        child: Text("Edit Profile",
                            style: TextStyle(color: Colors.black)),
                        onPressed: () {
                          setState(() {
                            edit = true;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.orange[200],
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            textStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
