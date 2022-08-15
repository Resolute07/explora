import 'package:explora/authentication/WelcomeScreen.dart';

import 'package:flutter/material.dart';

class IndiaPage extends StatelessWidget {
  const IndiaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0)
        ),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      elevation: 20.0,
                      shadowColor: Colors.blue,
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
                                image: AssetImage(
                                  'assets/Char_Minar_1660443246676.webp'
                                ),
                                height: 240,
                                fit: BoxFit.cover,
                              ),

                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'India is one of the oldest civilizations in the world with a kaleidoscopic variety and rich cultural heritage.'
                                  ' It has achieved all-round socio-economic progress since Independence. '
                                  'As the 7th largest country in the world, India stands apart from the rest of Asia, '
                                  'marked off as it is by mountains and the sea, which give the country a distinct geographical entity.'
                                  ' Bounded by the Great Himalayas in the north, it stretches southwards and at the Tropic of Cancer,'
                                  ' tapers off into the Indian Ocean between the Bay of Bengal on the east and the Arabian Sea on the west'

                                'Lying entirely in the northern hemisphere, the mainland extends between latitudes 8° 4\' and 37\° 6\' north, longitudes 68° 7\' and 97° 25\' east and measures about 3,214 km from north to south between the extreme latitudes and about 2,933 km from east to west between the extreme longitudes. It has a land frontier of about 15,200 km. The total length of the coastline of the mainland, Lakshadweep Islands and Andaman & Nicobar Islands is 7,516.6 km.',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 20.0),
                            ),
                          ),
                          Card(
                            color: Colors.black54,
                            child: TextButton(onPressed: (){
                              Navigator.pushNamed(context, WelcomeScreen.id);
                            }, child: Text(
                              'Login To Explore',style: TextStyle(
                              color: Colors.white54
                            ),
                            )),
                          )



                              ],
                            ),
                          )],
                        ),
                      ),
                    ),

                ),
      ),

    );}
}
