import 'package:final_project/DetailPage.dart';
import 'package:final_project/ListProduct.dart';
import 'package:final_project/UserProfile.dart';
import 'package:final_project/Widgets/SingleProduct.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:final_project/provider/Category_provider.dart';
import 'package:final_project/provider/Product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'LogInScreen.dart';

import 'package:final_project/model/Foods.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

CategoryProvider categoryProvider;
ProductProvider productProvider;

var featured;
var featuredSnapShot;
// var burger;
// var drinks;
// var pizza;
// var pastry;
Foods burgerData;
Foods pizzaData;
Foods drinkData;
Foods pastryData;

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  bool home = true;
  bool about = false;
  bool cart = false;

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Dee Marie"),
            currentAccountPicture: CircleAvatar(
              maxRadius: 60,
              backgroundColor: Colors.white,
              child: Container(
                height: 50,
                child: Image(
                  color: Colors.grey,
                  image: AssetImage("assets/images/drink.png"),
                ),
              ),
            ),
            decoration: BoxDecoration(color: Colors.blueGrey),
            accountEmail: Text("deemarie014@gmail.com"),
          ),
          ListTile(
            selected: home,
            onTap: () {
              setState(() {
                home = true;
                about = false;
                cart = false;
              });
            },
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          ListTile(
            selected: cart,
            onTap: () {
              setState(() {
                cart = true;
                home = false;
                about = false;
              });
            },
            leading: Icon(Icons.shopping_cart),
            title: Text("My Cart"),
          ),
          ListTile(
            selected: about,
            onTap: () {
              setState(() {
                cart = false;
                home = false;
                about = true;
              });
            },
            leading: Icon(Icons.info),
            title: Text("About"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => LogInScreen()));
            },
            leading: Icon(Icons.exit_to_app),
            title: Text("Log out"),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSlider() {
    return Center(
      child: Container(
          height: 250,
          child: Carousel(
            autoplay: true,
            showIndicator: false,
            images: [
              AssetImage("assets/images/upPic.jpg"),
              AssetImage("assets/images/veggie.png"),
              AssetImage("assets/images/upPic.jpg"),
            ],
          )),
    );
  }

  Widget _buildCategories() {
    List<Foods> burger = categoryProvider.getBurgerList;
    List<Foods> drinks = categoryProvider.getDrinksList;
    List<Foods> pizza = categoryProvider.getPizzaList;
    List<Foods> pastry = categoryProvider.getPastryList;
    return Column(
      children: <Widget>[
        Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "CATEGORIES",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          // height: 70,
          // width: 180,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ListProduct(
                            name: "Burgers",
                            snapShot: burger,
                          )));
                },
                child: CircleAvatar(
                  maxRadius: 40,
                  backgroundColor: Colors.teal,
                  child: Container(
                    height: 50,
                    child: Image(
                      color: Colors.white,
                      image: AssetImage("assets/images/hamburger.png"),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ListProduct(
                            name: "Drinks",
                            snapShot: drinks,
                          )));
                },
                child: CircleAvatar(
                  maxRadius: 40,
                  backgroundColor: Colors.blueGrey,
                  child: Container(
                    height: 50,
                    child: Image(
                      color: Colors.white,
                      image: AssetImage("assets/images/drink.png"),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ListProduct(
                            name: "Pizza",
                            snapShot: pizza,
                          )));
                },
                child: CircleAvatar(
                  maxRadius: 40,
                  backgroundColor: Colors.indigo,
                  child: Container(
                    height: 50,
                    child: Image(
                      color: Colors.white,
                      image: AssetImage("assets/images/Pizza.png"),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ListProduct(
                            name: "Cake",
                            snapShot: pastry,
                          )));
                },
                child: CircleAvatar(
                  maxRadius: 40,
                  backgroundColor: Colors.purple,
                  child: Container(
                    height: 60,
                    child: Image(
                      color: Colors.white,
                      image: AssetImage("assets/images/cake.png"),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeatured() {
    List<Foods> featured;
    List<Foods> homeFeature;
    // featured = productProvider.getFeaturedList;
    homeFeature = productProvider.getHomeFeatureList;
    return Container(
      width: 180,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("FEATURED",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.of(context).pushReplacement(MaterialPageRoute(
              //         builder: (ctx) => ListProduct(
              //               name: "FEATURED",
              //               snapShot: featured,
              //             )));
              //},
              Text("",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              //  ),
            ],
          ),
          Row(
              children: productProvider.getHomeFeatureList.map((e) {
            return Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (ctx) => DetailPage(
                                image: e.image,
                                name: e.name,
                                price: e.price,
                                description:
                                    "Double Cheeseburger features two 100% pure beef burger patties seasoned with just a pinch of salt and pepper. It's topped with tangy pickles, chopped onions, ketchup, mustard and two slices of melty American cheese."),
                          ),
                        );
                      },
                      child: SingleProduct(
                        image: e.image,
                        name: e.name,
                        price: e.price,
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                                image: e.image,
                                name: e.name,
                                price: e.price,
                                description:
                                    "Pineapple might not be the first thing that comes to mind when you think pizza. But add in some ham and it creates an unexpectedly solid sweet and salty combination for this type of pizza."),
                          ),
                        );
                      },
                      child: SingleProduct(
                          image: e.image, name: e.name, price: e.price)),
                ],
              ),
            );
          }).toList()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    categoryProvider = Provider.of<CategoryProvider>(context);
    categoryProvider.getBurgerData();
    categoryProvider.getDrinksData();
    categoryProvider.getPizzaData();
    categoryProvider.getPastryData();
    productProvider = Provider.of<ProductProvider>(context);
    // productProvider.getFeaturedData();
    productProvider.getHomeFeatureData();

    return Scaffold(
        key: _key,
        drawer: _buildDrawer(),
        appBar: AppBar(
            title: Text("Home Page", style: TextStyle(color: Colors.black)),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.account_circle, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => UserProfile()));
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.exit_to_app, color: Colors.black),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => LogInScreen()));
                },
              ),
            ]),
        body: Container(
          height: double.infinity,
          width: 500,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                _buildImageSlider(),
                _buildCategories(),
                SizedBox(
                  height: 30,
                ),
                _buildFeatured(),

                //_builFavorites(),
              ],
            ),
          ),
        ));
  }
}
            
            //   );
            //        });
            // });
            //  }),
            //   )
           // )

  

