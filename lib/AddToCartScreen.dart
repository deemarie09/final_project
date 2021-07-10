import 'package:final_project/CheckOut.dart';
import 'package:final_project/HomePage.dart';
import 'package:final_project/Widgets/CartSingleProduct.dart';
import 'package:flutter/material.dart';
import 'package:final_project/provider/Product_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddToCartScreen extends StatefulWidget {
  // final String name;
  // final String image;
  // int quantity;
  // final double price;
  // AddToCartScreen({this.name, this.image, this.quantity, this.price});
  @override
  _AddToCartScreenState createState() => _AddToCartScreenState();
}

int count = 1;
ProductProvider productProvider;

class _AddToCartScreenState extends State<AddToCartScreen> {
  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
          child: Text("Continue", style: TextStyle(color: Colors.black)),
          onPressed: () {
            productProvider.getCartData();
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => CheckOut()));
          },
          style: ElevatedButton.styleFrom(
              primary: Colors.orange[200],
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ),
      ),
      appBar: AppBar(
        title: Text("My Cart", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => HomePage()));
          },
        ),
        // actions: <Widget>[
        //   //IconButton(icon: Icon(Icons.notifications_none), onPressed: () {}),
        // ]
      ),
      body:
          // Container(
          //   height: 700,
          //   padding: EdgeInsets.symmetric(horizontal: 10),
          //   child:
          ListView.builder(
              // shrinkWrap: true,
              itemCount: productProvider.getCartModelListLength,
              itemBuilder: (ctx, index) => CartSingleProduct(
                    isCount: false,
                    image: productProvider.getCartModelList[index].image,
                    name: productProvider.getCartModelList[index].name,
                    quantity: productProvider.getCartModelList[index].quantity,
                    price: productProvider.getCartModelList[index].price,
                  )),
    );
  }
}
