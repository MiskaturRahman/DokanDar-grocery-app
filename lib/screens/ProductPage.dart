import 'dart:async';
import 'package:dokandar_app/screens/addToCart/ScopeManage.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../shared/Product.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/partials.dart';
import '../shared/buttons.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductPage extends StatefulWidget {
  final String pageTitle;
  final Product productData;

  ProductPage({Key key, this.pageTitle, this.productData}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  double _rating = 4;
  int _quantity = 1;

  showSnak(bool flag, String name) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(flag
          ? "${name} added in favourite list"
          : "${name} removed from favourite list"),
      duration: Duration(seconds: 2),
    ));
  }

  showCartSnak(String msg, bool flag) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        msg,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: (flag) ? Colors.green : Colors.red[500],
      duration: Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        centerTitle: true,
        leading: BackButton(
          color: darkText,
        ),
        title: Text(widget.productData.name, style: h4),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(top: 100, bottom: 100),
                      padding: EdgeInsets.only(top: 100, bottom: 50),
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(widget.productData.name, style: h5),
                          Text(widget.productData.price, style: h3),
                          Container(
                            margin: EdgeInsets.only(top: 5, bottom: 20),
                            child: SmoothStarRating(
                              allowHalfRating: false,
                              onRatingChanged: (v) {
                                setState(() {
                                  _rating = v;
                                });
                              },
                              starCount: 5,
                              rating: _rating,
                              size: 27.0,
                              color: Colors.orange,
                              borderColor: Colors.orange,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 25),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Text('Quantity', style: h6),
                                  margin: EdgeInsets.only(bottom: 15),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 55,
                                      height: 55,
                                      // ignore: deprecated_member_use
                                      child: OutlineButton(
                                        onPressed: () {
                                          setState(() {
                                            _quantity += 1;
                                          });
                                        },
                                        child: Icon(Icons.add),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child:
                                          Text(_quantity.toString(), style: h3),
                                    ),
                                    Container(
                                      width: 55,
                                      height: 55,
                                      // ignore: deprecated_member_use
                                      child: OutlineButton(
                                        onPressed: () {
                                          setState(() {
                                            if (_quantity == 1) return;
                                            _quantity -= 1;
                                          });
                                        },
                                        child: Icon(Icons.remove),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 180,
                            child: froyoOutlineBtn('Buy Now', () {}),
                          ),
                          Container(
                            width: 180,
                            child: froyoFlatBtn('Add to Cart', () {}),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 15,
                                spreadRadius: 5,
                                color: Color.fromRGBO(0, 0, 0, .05))
                          ]),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 200,
                      height: 160,
                      child: foodItem(widget.productData,
                          isProductPage: true,
                          onTapped: () {},
                          imgWidth: 250,
                          onLike: () {}),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 18.0),
          height: 60.0,
          decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border(top: BorderSide(color: Colors.grey[300], width: 1.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 60.0,
                      child: Text(
                        "Total Amount",
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                    ),
                    Text("\$${widget.productData.price.toString()}",
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              ScopedModelDescendant<AppModel>(
                builder: (context, child, model) {
                  return RaisedButton(
                    color: Colors.deepOrange,
                    onPressed: () {
                      model.addCart(detail);
                      Timer(Duration(milliseconds: 500), () {
                        showCartSnak(model.cartMsg, model.success);
                      });
                    },
                    child: Text(
                      "ADD TO CART",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              )
            ],
          )),
    );
  }
}
