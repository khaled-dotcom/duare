import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import 'item_list_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _style = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black);
  final _style1 = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 22.0, color: Colors.black);

  String _selectedOption = null;

  List<DropdownMenuItem<String>> _dropDownItem() {
    List<String> ddl = [
      "Restaurents",
      "Medicine",
      "Electronics",
    ];
    return ddl
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(
                value,
                style: _style,
              ),
            ))
        .toList();
  }

  final featurItem = [
    {
      "image": "assets/grocery/filter.jpg",
      "title": "Classic Pureit",
      "subtitle": "Uniliver",
      "price": "From : TK 40"
    },
    {
      "image": "assets/grocery/onion.jpg",
      "title": "Onion",
      "subtitle": "Indian(Imported)",
      "price": "From : TK 4000"
    },
    {
      "image": "assets/grocery/filter.jpg",
      "title": "Classic Pureit",
      "subtitle": "Uniliver",
      "price": "From : TK 4000"
    },
    {
      "image": "assets/grocery/onion.jpg",
      "title": "Onion",
      "subtitle": "Indian(Imported)",
      "price": "From : TK 40"
    },
  ];
  final fruitVegItem = [
    {"image": "assets/grocery/veg1.jpg", "title": "Fresh Vegetable"},
    {"image": "assets/grocery/fruits.jpg", "title": "Fresh Fruits"},
    {"image": "assets/grocery/veg1.jpg", "title": "Fresh Vegetable"},
    {"image": "assets/grocery/fruits.jpg", "title": "Fresh Fruits"},
  ];
  final groceryItem = [
    {"image": "assets/grocery/rice.jpg", "title": "Rice"},
    {"image": "assets/grocery/oil.jpg", "title": "Oil"},
    {"image": "assets/grocery/rice.jpg", "title": "Rice"},
    {"image": "assets/grocery/oil.jpg", "title": "Oil"},
  ];
  final beverageItem = [
    {"image": "assets/grocery/tea.jpg", "title": "Tea"},
    {"image": "assets/grocery/coffee.jpg", "title": "Coffee"},
    {"image": "assets/grocery/tea.jpg", "title": "Tea"},
    {"image": "assets/grocery/coffee.jpg", "title": "Coffee"},
  ];
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: _selectedOption,
                      items: _dropDownItem(),
                      onChanged: (value) {
                        _selectedOption = value;
                        switch (value) {
                          case "Restaurents":
                            /* Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Restaurents()),
                            );*/
                            break;
                          case "Medicine":
                            /* Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Medicine()),
                            );*/
                            break;
                          case "Electronics":
                            /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Electronics()),
                            );*/
                            break;
                        }
                      },
                      hint: Text(
                        'Grocery',
                        style: _style,
                      ),
                    ),
                  ),
                  FlatButton(
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.black,
                        ),
                        Text(
                          "Offfice",
                          style: _style,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                height: 200,
                width: double.infinity,
                child: Carousel(
                  dotSize: 7.0,
                  dotSpacing: 18.0,
                  autoplay: true,
                  animationCurve: Curves.fastOutSlowIn,
                  animationDuration: Duration(milliseconds: 800),
                  dotBgColor: Colors.transparent,
                  dotColor: Colors.blue,
                  dotVerticalPadding: 5.0,
                  dotPosition: DotPosition.bottomCenter,
                  showIndicator: true,
                  images: [
// Saved images
                    Image.asset('assets/grocery/banner.jpg', fit: BoxFit.cover),
                    Image.asset('assets/grocery/banner2.png',
                        fit: BoxFit.cover),
                    Image.asset('assets/grocery/banner2.png',
                        fit: BoxFit.cover),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.radio,
                          size: 30.0,
                          color: Colors.blue,
                        ),
                        onTap: () {},
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Use"),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Duare5%",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Text("To Get 5% Discount On Grocery Item Just.")
                    ],
                  ),
                ),
              ),
              _buildSectiontitle('Featured Items', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemList()),
                );
              }),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                height: 250,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: featurItem.length,
                    separatorBuilder: (_, __) => SizedBox(width: 15),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
                            overflow: Overflow.visible,
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.only(top: 15.0, bottom: 15.0),
                                height: 150,
                                width: _width / 2.7,
                                child: Image.asset(featurItem[index]['image']),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: Colors.grey, width: 1)),
                              ),
                              Positioned(
                                top: 30,
                                child: Container(
                                  height: 30,
                                  width: _width / 4,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                      )),
                                  child: Center(
                                      child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      featurItem[index]['price'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0),
                                    ),
                                  )),
                                ),
                              )
                            ],
                          ),
                          Text(
                            featurItem[index]['title'],
                            style: _style1,
                          ),
                          Text(featurItem[index]['subtitle']),
                        ],
                      );
                    }),
              ),
              _buildSectiontitle('Fruitts & Veg', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemList()),
                );
              }),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                height: 250,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: fruitVegItem.length,
                    separatorBuilder: (_, __) => SizedBox(width: 15),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 15.0,
                              bottom: 15.0,
                            ),
                            height: 150,
                            width: _width / 2.7,
                            child: Container(
                              child: Image.asset(fruitVegItem[index]['image']),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border:
                                    Border.all(color: Colors.grey, width: 1)),
                          ),
                          Text(
                            fruitVegItem[index]['title'],
                            style: _style1,
                          ),
                        ],
                      );
                    }),
              ),
              _buildSectiontitle('Grocery', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemList()),
                );
              }),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                height: 250,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: groceryItem.length,
                    separatorBuilder: (_, __) => SizedBox(width: 15),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 15.0,
                              bottom: 15.0,
                            ),
                            height: 150,
                            width: _width / 2.7,
                            child: Container(
                              child: Image.asset(groceryItem[index]['image']),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border:
                                    Border.all(color: Colors.grey, width: 1)),
                          ),
                          Text(
                            groceryItem[index]['title'],
                            style: _style1,
                          ),
                        ],
                      );
                    }),
              ),
              _buildSectiontitle('Beverages', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemList()),
                );
              }),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                height: 250,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: beverageItem.length,
                    separatorBuilder: (_, __) => SizedBox(width: 15),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 15.0,
                              bottom: 15.0,
                            ),
                            height: 150,
                            width: _width / 2.7,
                            child: Container(
                              child: Image.asset(beverageItem[index]['image']),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border:
                                    Border.all(color: Colors.grey, width: 1)),
                          ),
                          Text(
                            beverageItem[index]['title'],
                            style: _style1,
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectiontitle(String title, [Function onTap]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: _style,
        ),
        InkWell(
          onTap: onTap ?? () {},
          child: Text(
            'View All',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
