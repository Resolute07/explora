

import 'package:url_launcher/url_launcher.dart';
import 'package:explora/components/places.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  final Places data1;
  const Info({
    Key? key,
    required this.data1,
  }) : super(key: key);


  Future<void> mapLauncher(String? value, String? query, String? state) async {
    Uri mapurl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$value $query $state ');
    if (await canLaunchUrl(mapurl)) {
      await launchUrl(mapurl);
    } else {
      throw 'error in opening the map ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Hero(
                    tag: 'card${data1.srno}.',
                    child: Card(
                      elevation: 20.0,
                      shadowColor: Colors.blueGrey,
                      color: Colors.white54,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0)),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Ink.image(
                                image: AssetImage('assets/placesImage/image${data1.srno}.jpg'),
                                height: 240,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              data1.description as String,
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 20.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Location :',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 20.0),
                                ),
                                Text(
                                  data1.location as String,
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 20.0),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Period : ',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 20.0),
                                ),
                                Text(
                                  data1.period as String,
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 20.0),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Enlistment Year : ',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 20.0),
                                ),
                                Text(
                                  data1.enlistment as String,
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 20.0),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  ' Site Type : ',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 20.0),
                                ),
                                Text(
                                  data1.sitetype as String,
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 20.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FloatingActionButton(
                            elevation: 8.0,
                            splashColor: Colors.blue,
                            backgroundColor: Colors.black54,
                            onPressed: () {
                              mapLauncher(null, data1.name, data1.location);
                            },
                            child: Icon(Icons.location_on)),
                        FloatingActionButton(
                            elevation: 8.0,
                            splashColor: Colors.blue,
                            backgroundColor: Colors.black54,
                            onPressed: () {
                              mapLauncher('Restaurants near', data1.name,
                                  data1.location);
                            },
                            child: Icon(Icons.restaurant)),
                        FloatingActionButton(
                            elevation: 8.0,
                            splashColor: Colors.blue,
                            backgroundColor: Colors.black54,
                            onPressed: () {
                              mapLauncher(
                                  'hotels near', data1.name, data1.location);
                            },
                            child: Icon(Icons.hotel)),
                        FloatingActionButton(
                            elevation: 8.0,
                            splashColor: Colors.blue,
                            backgroundColor: Colors.black54,
                            onPressed: () {
                              mapLauncher('public toilets near', data1.name,
                                  data1.location);
                            },
                            child: Icon(Icons.wc)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
