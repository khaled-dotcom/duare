import 'package:duare/view/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  void launchWhatsApp({
    @required int phone,
    @required String message,
  }) async {
    String url() {
      return "https://wa.me/$phone/?text=${Uri.parse(message)}";
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

  final listItem = [
    {"image": "assets/grocery.jpg", "title": "Grocery"},
    {"image": "assets/rest.jpg", "title": "Restaurent"},
    {"image": "assets/medicine.jpg", "title": "Medicine"},
    {"image": "assets/elect.jpg", "title": "Electronics"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //logo
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                    )),
                child: Center(child: Image.asset("assets/logo1.png")),
              ), //logo
              //title
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "Explore Our Item",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30.0),
                        ),
                      ),
                    ),
                    Container(
                      child: GridView.builder(
                        itemCount: listItem.length,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(child: Image.asset(listItem[index]['image'])),
                                  FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      listItem[index]['title'],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black12,
                                    width: 1,
                                  )),
                            ),
                            onTap: () {
                              if (index == 0) Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "Can't ase app?",
                              style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "Order by WhatsApp",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Image.asset("assets/whts.png", height: 50, width: 50),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
