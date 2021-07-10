import 'package:final_project/Widgets/SingleProduct.dart';
import 'package:flutter/material.dart';

import 'model/Foods.dart';

class ListProduct extends StatelessWidget {
  final String name;
  final List<Foods> snapShot;

  ListProduct({this.name, this.snapShot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),

        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.search),
        //     onPressed: () {},
        //   ),
        // IconButton(
        //   icon: Icon(Icons.notifications_none),
        //   onPressed: () {},
        // ),
        //],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 50,
            width: double.infinity,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(name,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 640,
            child: GridView.count(
              scrollDirection: Axis.vertical,

              // child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              //   scrollDirection: Axis.vertical,
              children: snapShot
                  .map(
                    (widget) => SingleProduct(
                      price: widget.price,
                      image: widget.image,
                      name: widget.name,
                    ),
                  )
                  .toList(),

              // itemCount: snapShot.data.documents.length,
              // itemBuilder: (ctx, index) => SingleProduct(
              //   image: snapShot.data.documents[index]["image"],
              //   name: snapShot.data.documents[index]["name"],
              //   price: snapShot.data.documents[index]["price"],
              // ),
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     childAspectRatio: 0.8,
              //     crossAxisSpacing: 10,
              //     mainAxisSpacing: 10),
            ),
          )
          //),
        ],
      ),
    );
  }
}
