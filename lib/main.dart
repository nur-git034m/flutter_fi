import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelui/dummyContinent.dart';
import 'package:travelui/dummyPopular.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 260,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(26),
                    bottomRight: Radius.circular(26),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/footstep.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 20,
                      left: 10,
                      right: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                            child: Text(
                              "Discovery",
                              style: GoogleFonts.lato(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                textStyle: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8, right: 8),
                            padding: EdgeInsets.only(left: 10, right: 10),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: 250,
                                  height: 50,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: "Search Your Destination...",
                                        labelStyle: GoogleFonts.openSans(),
                                        disabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        fillColor: Colors.white,
                                        focusColor: Colors.white),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.search),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 100,
                margin: EdgeInsets.only(left: 10),
                child: HorizontalItems(),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Popular Destination",
                      style: GoogleFonts.roboto(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text("See all",
                            style: GoogleFonts.openSans(
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                            )),
                        Icon(Icons.arrow_forward,
                            size: 15, color: Colors.black54),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 240,
                margin: EdgeInsets.only(left: 10),
                child: PopularDestination(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HorizontalItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyContinent.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        final horizontalItem = dummyContinent[index];
        return Container(
          width: 170,
          height: 120,
          margin: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(horizontalItem.urlimage),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                width: 170,
                height: 120,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Colors.white30,
                    Colors.black12,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
              ),
              Center(
                child: Text(
                  horizontalItem.name,
                  style: GoogleFonts.nunitoSans(
                      fontSize: 20,
                      textStyle: TextStyle(
                        color: Colors.white,
                      )),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class PopularDestination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyPopular.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        final popular = dummyPopular[index];
        return Column(
          children: <Widget>[
            Container(
              width: 230,
              height: 160,
              margin: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(popular.urlimage),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(height: 7),
            Container(
              width: 230,
              height: 50,
              color: Colors.white,
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    popular.name,
                    style: GoogleFonts.arvo(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        textStyle: TextStyle(
                          color: Colors.blue,
                        )),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        size: 18,
                        color: Colors.black54,
                      ),
                      SizedBox(height: 8),
                      Text(
                        popular.country,
                        style: GoogleFonts.roboto(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
