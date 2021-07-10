import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/model/Foods.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  Foods burgerData;
  List<Foods> burger = [];
  Foods drinksData;
  List<Foods> drinks = [];
  Foods pizzaData;
  List<Foods> pizza = [];
  Foods pastryData;
  List<Foods> pastry = [];
  Future<void> getBurgerData() async {
    List<Foods> newList = [];
    QuerySnapshot burgerSnapShot = await Firestore.instance
        .collection("category")
        .document("MxRUUOBw9bATcpVK1774")
        .collection("burger")
        .getDocuments();

    burgerSnapShot.documents.forEach(
      (element) {
        burgerData = Foods(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(burgerData);
      },
    );
    burger = newList;
    notifyListeners();
  }

  List<Foods> get getBurgerList {
    return burger;
  }

  Future<void> getDrinksData() async {
    List<Foods> newList = [];
    QuerySnapshot drinksSnapShot = await Firestore.instance
        .collection("category")
        .document("MxRUUOBw9bATcpVK1774")
        .collection("drinks")
        .getDocuments();

    drinksSnapShot.documents.forEach(
      (element) {
        drinksData = Foods(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(drinksData);
      },
    );
    drinks = newList;
    notifyListeners();
  }

  List<Foods> get getDrinksList {
    return drinks;
  }

  Future<void> getPizzaData() async {
    List<Foods> newList = [];
    QuerySnapshot pizzaSnapShot = await Firestore.instance
        .collection("category")
        .document("MxRUUOBw9bATcpVK1774")
        .collection("pizza")
        .getDocuments();

    pizzaSnapShot.documents.forEach(
      (element) {
        pizzaData = Foods(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(pizzaData);
      },
    );
    pizza = newList;
    notifyListeners();
  }

  List<Foods> get getPizzaList {
    return pizza;
  }

  Future<void> getPastryData() async {
    List<Foods> newList = [];
    QuerySnapshot pastrySnapShot = await Firestore.instance
        .collection("category")
        .document("MxRUUOBw9bATcpVK1774")
        .collection("pastry")
        .getDocuments();

    pastrySnapShot.documents.forEach(
      (element) {
        pastryData = Foods(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(pastryData);
      },
    );
    pastry = newList;
    notifyListeners();
  }

  List<Foods> get getPastryList {
    return pastry;
  }
}
