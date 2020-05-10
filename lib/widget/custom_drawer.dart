import 'package:flutter/material.dart';
import 'package:flutter_jogo_velha/titles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);

  Widget _buildDrawerBack() => Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromARGB(255, 203, 236, 241), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      );

  @override
  Widget build(BuildContext context) {
     return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    // Positioned(
                    //   top: 8.0,
                    //   left: 0.0,
                    //   child: Text("Flutter's\nClothing",
                    //     style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Jogo da Velha",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              
                            ],
                          )
                      
                      
                    ),
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.people_outline, "Player Vs PC", pageController, 0),
              DrawerTile(Icons.computer, "PC Vs PC", pageController, 1),
             
            ],
          )
        ],
      ),
    );
  }
}
