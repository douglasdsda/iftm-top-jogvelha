import 'package:flutter/material.dart';
import 'package:flutter_jogo_velha/data/tabuleiro.dart';
import 'package:scoped_model/scoped_model.dart';
 
import 'screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ScopedModel(
      model: Tabuleiro(),
       child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    ),);
  }
}

 