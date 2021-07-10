import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String image;
  final double price;
  final String name;

  SingleProduct({this.image, this.price, this.name});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 280,
        width: 170,
        //color: Colors.blue,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Container(
                  height: 170,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(image),
                    ),
                  )),
            ),
            Text(" ₱${price.toString()}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey)),
            Container(
              child: Text(name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
