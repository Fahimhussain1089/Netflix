
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixapp/Screens/home_screen.dart';
import 'package:netflixapp/Screens/nav_screen.dart';

void main(){
  runApp(Myapp());
}
class Myapp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Netflix UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor:  Colors.black,
      ),
      home: NavScreen(),
    );
  }
}