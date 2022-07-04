import 'package:bmicalculator/input_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


const bottomContainerHeight=80.0;
const activeCardColor=Color(0xFF1D1E33);
const bottomContainerColor=Colors.red;


void main()=>runApp(BmiCalculator());

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF0A0E21),
        accentColor: Colors.purple,
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.red),
        ),
      ),

      home: InputPage(),

    );
  }


}







