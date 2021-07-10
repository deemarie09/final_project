import 'package:final_project/HomePage.dart';
import 'package:final_project/Widgets/CartSingleProduct.dart';
import 'package:final_project/provider/Product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  // final String name;
  // final String image;
  // int quantity;
  // final double price;
  // CheckOut({this.name, this.image, this.quantity, this.price});
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int count;
  ProductProvider productProvider;

  Widget _buildBottomDetails({String startName, String endName}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(startName),
          Text(endName),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double total = 0;
    double deliveryfee = 25;
    double finalTotal;
    productProvider = Provider.of<ProductProvider>(context);
    productProvider.getcheckOutModelList.forEach((element) {
      total += element.price * element.quantity;
    });
    finalTotal = total + deliveryfee;
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Out Page", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => HomePage()));
          },
        ),
        // actions: <Widget>[
        //  // IconButton(icon: Icon(Icons.notifications_none), onPressed: () {}),
        // ]
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
          child: Text("Buy Now", style: TextStyle(color: Colors.black)),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              primary: Colors.orange[200],
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ),
      ),
      body:
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          //   child:
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: productProvider.getcheckOutModelListLength,
                itemBuilder: (ctx, index) {
                  return CartSingleProduct(
                    isCount: false,
                    image: productProvider.getcheckOutModelList[index].image,
                    name: productProvider.getcheckOutModelList[index].name,
                    price: productProvider.getcheckOutModelList[index].price,
                    quantity:
                        productProvider.getcheckOutModelList[index].quantity,
                  );
                }),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildBottomDetails(
                  startName: "Price",
                  endName: "\$ $total",
                ),
                SizedBox(
                  height: 5,
                ),
                _buildBottomDetails(
                  startName: "Delivery fee",
                  endName: "\$ $deliveryfee",
                ),
                SizedBox(
                  height: 5,
                ),
                _buildBottomDetails(
                  startName: "Total",
                  endName: "\$ $finalTotal",
                ),
              ],
            ),
          )
        ],
      ),
      // )
    );
  }
}
