// import 'package:final_project/CheckOut.dart';
// import 'package:flutter/material.dart';

// class CheckSingleCart extends StatefulWidget {
//   final String name;
//   final String image;
//   int quantity;
//   final double price;
//   CheckSingleCart({this.name, this.image, this.quantity, this.price});
//   bool isCount = true;
//   @override
//   _CheckSingleCartState createState() => _CheckSingleCartState();
// }

// class _CheckSingleCartState extends State<CheckSingleCart> {
//   @override
//   Widget build(BuildContext context) {
//     // count = widget.quantity;
//     return Container(
//       height: 180,
//       width: 250,
//       margin: EdgeInsets.symmetric(horizontal: 10),
//       child: Card(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Row(
//               children: <Widget>[
//                 Container(
//                   height: 170,
//                   width: 160,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                         fit: BoxFit.fill, image: NetworkImage(widget.image)),
//                   ),
//                 ),
//                 Container(
//                   height: 160,
//                   width: 200,
//                   child: ListTile(
//                     title: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           widget.name,
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Text("Burger"),
//                         Text(
//                           widget.price.toString(),
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                         Container(
//                           height: 30,
//                           width: 120,
//                           color: Colors.grey[200],
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: <Widget>[
//                               GestureDetector(
//                                   child: Icon(Icons.remove),
//                                   onTap: () {
//                                     setState(() {
//                                       if (widget.quantity > 1) {
//                                         widget.quantity--;
//                                       }
//                                     });
//                                   }),
//                               Text(widget.quantity.toString(),
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                   )),
//                               GestureDetector(
//                                   child: Icon(Icons.add),
//                                   onTap: () {
//                                     setState(() {
//                                       widget.quantity++;
//                                     });
//                                   }),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
