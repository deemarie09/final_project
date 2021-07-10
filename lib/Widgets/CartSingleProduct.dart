import 'package:final_project/provider/Product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CartSingleProduct extends StatefulWidget {
  bool isCount;
  final String name;
  final String image;
  int quantity;
  final double price;
  CartSingleProduct({
    this.isCount,
    this.name,
    this.image,
    this.quantity,
    this.price,
  });

  @override
  _CartSingleProductState createState() => _CartSingleProductState();
}

ProductProvider productProvider;

class _CartSingleProductState extends State<CartSingleProduct> {
  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    productProvider.getCheckOutData(
      quantity: widget.quantity,
      image: widget.image,
      name: widget.name,
      price: widget.price,
    );
    return Container(
      height: 180,
      width: double.infinity,
      // margin: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 170,
                  width: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill, image: NetworkImage(widget.image)),
                  ),
                ),
                Container(
                  height: 160,
                  width: 200,
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Pizza"),
                        Text(
                          widget.price.toString(),
                          style: TextStyle(color: Colors.grey),
                        ),
                        Container(
                            height: 30,
                            width: widget.isCount == false ? 120 : 100,
                            color: Colors.grey[200],
                            child: widget.isCount == false
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      GestureDetector(
                                          child: Icon(Icons.remove),
                                          onTap: () {
                                            setState(() {
                                              if (widget.quantity > 1) {
                                                widget.quantity--;
                                                productProvider.getCheckOutData(
                                                  quantity: widget.quantity,
                                                  image: widget.image,
                                                  name: widget.name,
                                                  price: widget.price,
                                                );
                                                // productProvider.getCountData(
                                                //  count: widget.quantity,
                                                // );
                                              }
                                            });
                                          }),
                                      Text(widget.quantity.toString(),
                                          style: TextStyle(
                                            fontSize: 14,
                                          )),
                                      GestureDetector(
                                          child: Icon(Icons.add),
                                          onTap: () {
                                            setState(() {
                                              widget.quantity++;
                                              productProvider.getCheckOutData(
                                                quantity: widget.quantity,
                                                image: widget.image,
                                                name: widget.name,
                                                price: widget.price,
                                              );
                                              // productProvider.getCountData(
                                              //     count: widget.quantity,
                                              //     );
                                            });
                                          })
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                        Text("Quantity"),
                                        Text(
                                          widget.quantity.toString(),
                                        )
                                      ])),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
