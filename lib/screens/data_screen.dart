import 'package:explora/screens/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:explora/components/places.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

User? loggedInUser;
Uri url = Uri.parse('https://unescowhsindia-api.herokuapp.com/api');

class DataScreen extends StatefulWidget {
  static const String id = 'datascreen';

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<List<Places>> getData() async {
    http.Response response = await http
        .get(Uri.parse('https://unescowhsindia-api.herokuapp.com/api'));
    var decoded = jsonDecode(response.body);
    List<Places> places = [];
    for (var data in decoded) {
      Places place = Places(
          srno: data['sr_no'],
          name: data['name'],
          location: data['location'],
          period: data['period'],
          description: data['description'],
          imagelink: data['image_link'],
          enlistment: data['enlistment_year'],
          sitetype: data['site_type']);
      places.add(place);
    }

    return places;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'India\'s Heritage',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple
          ),
        ),
      ),

      backgroundColor: Colors.purpleAccent,


      body: Container(


          child: SafeArea(
            child: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.lightGreenAccent,
                ),
              );
            }
            return Swiper(
              layout: SwiperLayout.STACK,
              itemCount: snapshot.data.length,
              itemWidth: double.maxFinite,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children:[
                Hero(


                tag: 'card${snapshot.data[index].srno}',
                    transitionOnUserGestures: true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(

                          elevation: 10.0,
                          shadowColor: Colors.blue,
                          clipBehavior: Clip.antiAlias,
                          color: Colors.white54,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Ink.image(
                                image: NetworkImage(snapshot.data[index].imagelink),
                                height: 240,
                                fit: BoxFit.cover,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => Info(
                                          data1: snapshot.data[index],
                                        )));
                                  },
                                ),
                              ),


                            ],
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(snapshot.data[index].name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.deepPurple,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,

                            ),),
                        )
                      ],
                    )
                )]
                );
              },
            );
        },
      ),
          )),
    );
  }
}

// Padding(
// padding: const EdgeInsets.all(8.0),

//
// ),
// )),