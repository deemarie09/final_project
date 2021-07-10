import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/model/CartModel.dart';
import 'package:final_project/model/Foods.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  Foods featuredData;
  List<Foods> featured = [];
  List<CartModel> cartModelList = [];
  CartModel cartModel;

  List<CartModel> checkOutModelList = [];
  CartModel checkOutModel;

  void getCheckOutData({
    String name,
    String image,
    int quantity,
    double price,
  }) {
    checkOutModel =
        CartModel(name: name, image: image, price: price, quantity: quantity);
    checkOutModelList.add(checkOutModel);
  }

  List<CartModel> get getcheckOutModelList {
    return List.from(checkOutModelList);
  }

  int get getcheckOutModelListLength {
    return checkOutModelList.length;
  }

  void getCartData({
    String name,
    String image,
    int quantity,
    double price,
  }) {
    cartModel =
        CartModel(name: name, image: image, price: price, quantity: quantity);
    cartModelList.add(cartModel);
  }

  List<CartModel> get getCartModelList {
    return List.from(cartModelList);
  }

  int get getCartModelListLength {
    return cartModelList.length;
  }

  // Future<void> getFeaturedData() async {
  //   List<Foods> newList = [];
  //   QuerySnapshot featuredSnapShot = await Firestore.instance
  //       .collection("foods")
  //       .document("86GnO1bXikwpXJb7zviQ")
  //       .collection("featured")
  //       .getDocuments();

  //   featuredSnapShot.documents.forEach(
  //     (element) {
  //       featuredData = Foods(
  //           image: element.data["image"],
  //           name: element.data["name"],
  //           price: element.data["price"]);
  //       newList.add(featuredData);
  //     },
  //   );
  //   featured = newList;
  // }

  // List<Foods> get getFeaturedList {
  //   return featured;
  // }

  Foods homeFeatureData;
  List<Foods> homeFeature = [];
  Future<void> getHomeFeatureData() async {
    List<Foods> newList = [];
    QuerySnapshot featuredSnapShot =
        await Firestore.instance.collection("homeFeature").getDocuments();

    featuredSnapShot.documents.forEach(
      (element) {
        homeFeatureData = Foods(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(homeFeatureData);
      },
    );
    homeFeature = newList;
  }

  List<Foods> get getHomeFeatureList {
    return homeFeature;
  }
}
