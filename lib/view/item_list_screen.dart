import 'package:flutter/material.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  final fruitVegItem = [
    {"image": "assets/grocery/veg1.jpg", "title": "Fresh Vegetable"},
    {"image": "assets/grocery/fruits.jpg", "title": "Fresh Fruits"},
    {"image": "assets/grocery/veg1.jpg", "title": "Fresh Vegetable"},
    {"image": "assets/grocery/fruits.jpg", "title": "Fresh Fruits"},
    {"image": "assets/grocery/fruits.jpg", "title": "Fresh Fruits"},
    {"image": "assets/grocery/veg1.jpg", "title": "Fresh Vegetable"},
    {"image": "assets/grocery/fruits.jpg", "title": "Fresh Fruits"},
    {"image": "assets/grocery/fruits.jpg", "title": "Fresh Fruits"},
    {"image": "assets/grocery/veg1.jpg", "title": "Fresh Vegetable"},
    {"image": "assets/grocery/fruits.jpg", "title": "Fresh Fruits"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 30.0),
            child: GridView.builder(
              itemCount: fruitVegItem.length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 8.0),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 110,
                          child:
                          Image.asset(fruitVegItem[index]['image']),
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                          fruitVegItem[index]['title'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.black12, width: 1)),
                  ),
                  onTap: () {
                   /* if(index==0)
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen()),
                      );*/
                  },
                );
              },
            )),
      ),
    );
  }
}
