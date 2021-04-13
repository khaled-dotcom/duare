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

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //logo
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40))),
                child: Image.asset("assets/logo.jpg"),
              ), //logo
              SizedBox(
                height: 40,
              ),
              //title
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Explore Our Item",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              child: Container(
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: 110,
                                        width: 110,
                                        child: Image.asset("assets/grocery.jpg"),
                                      ),
                                      Text(
                                        "Grocery",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                      )
                                    ],
                                  ),
                                ),
                                width: _width / 2.3,
                                height: 170,
                                color: Colors.white,
                              ),
                              onTap: () {
                                /*Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>Grocer()),
                                );*/
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            GestureDetector(
                              child: Container(
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: 110,
                                        width: 110,
                                        child: CircleAvatar(
                                          radius: 50.0,
                                          backgroundImage:
                                              AssetImage("assets/rest.jpg"),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Restaurents",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                      )
                                    ],
                                  ),
                                ),
                                width: _width / 2.3,
                                height: 170,
                                color: Colors.white,
                              ),
                              onTap: () {
                                /*
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>Restaurents()),
                                );*/
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              child: Container(
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: 110,
                                        width: 110,
                                        child: Image.asset("assets/medicine.jpg"),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Medicine",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                      )
                                    ],
                                  ),
                                ),
                                width: _width / 2.3,
                                height: 170,
                                color: Colors.white,
                              ),
                              onTap: () {
                                /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>Medicine()),
                                );*/
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            GestureDetector(
                              child: Container(
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: 110,
                                        width: 110,
                                        child: Image.asset("assets/elect.jpg"),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Electronics",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                      )
                                    ],
                                  ),
                                ),
                                width: _width / 2.3,
                                height: 170,
                                color: Colors.white,
                              ),
                              onTap: () {
                                /*
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>Electronics()),
                                );*/
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(left: 130.0),
                child: Text(
                  "Can't Use App?",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Order By Whatsapp",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          image: DecorationImage(
                              image: AssetImage("assets/whts.png"))),
                    ),
                  ),
                  /* FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: () {
                          launchWhatsApp(
                              phone: 8801757264251, message: 'Hello');
                        },
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage(),
                        ))*/
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
