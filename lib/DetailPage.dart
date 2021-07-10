import 'package:final_project/AddToCartScreen.dart';
import 'package:flutter/material.dart';
import 'package:final_project/HomePage.dart';
import 'package:final_project/provider/Product_provider.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final String image;
  final String name;
  final double price;
  final String description;
  DetailPage({this.image, this.name, this.price, this.description});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int count = 1;
  ProductProvider productProvider;

  final TextStyle myStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  Widget _buildImage() {
    return Center(
      child: Container(
        width: 400,
        child: Card(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Container(
              height: 350,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(widget.image))),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDescriptionName() {
    return Container(
      height: 130,
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(widget.name, style: myStyle),
              Text(
                widget.price.toString(),
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text("DESCRIPTION", style: myStyle),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStateDescription() {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          //color: Colors.cyan,
          borderRadius: BorderRadius.circular(20)),
      child: Wrap(
        children: <Widget>[
          Text(
            widget.description,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantity() {
    return Container(
      child: Row(
        children: [
          Text("QUANTITY", style: myStyle),
        ],
      ),
    );
  }

  Widget _buildQuantityNum() {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.orange[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                    child: Icon(Icons.remove),
                    onTap: () {
                      setState(() {
                        if (count > 1) {
                          count--;
                        }
                      });
                    }),
                Text(count.toString(), style: myStyle),
                GestureDetector(
                    child: Icon(Icons.add),
                    onTap: () {
                      setState(() {
                        count++;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddToCart() {
    return ElevatedButton.icon(
      icon: Icon(Icons.shopping_cart, color: Colors.black),
      label: Text("Add to Cart", style: TextStyle(color: Colors.black)),
      onPressed: () {
        productProvider.getCartData(
          image: widget.image,
          name: widget.name,
          quantity: count,
          price: widget.price,
        );
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => AddToCartScreen()));
      },
      style: ElevatedButton.styleFrom(
          primary: Colors.orange[200],
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => HomePage()));
            }),
        // actions: <Widget>[
        //   IconButton(icon: Icon(Icons.notifications_none), onPressed: () {}),
        // ]
      ),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  _buildImage(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Column(
                      children: <Widget>[
                        _buildDescriptionName(),
                        _buildStateDescription(),
                        SizedBox(
                          height: 5,
                        ),
                        _buildQuantity(),
                        SizedBox(
                          height: 10,
                        ),
                        _buildQuantityNum(),
                      ],
                    ),
                  ),
                  _buildAddToCart(),
                ],
              ),
            ],
          )),
    );
  }
}
