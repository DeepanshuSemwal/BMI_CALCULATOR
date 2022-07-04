import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.interpretation,
        required this.bmiResult,
        required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center
          (
            child: Text('BMI CALCULATOR')),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: KTitleTextStyle,
              ),
            ),
          ),
          Expanded(
             flex: 5,
            child: ReusabaleCard(
              colour: KactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: KresultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: KbmiEditTextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: KBodyTextStyle,
                  ),
                ],
              ),
            ),

          ),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 16.0),
            child: ButtonTheme(
              minWidth: double.infinity,
              buttonColor: Colors.red,
              height: 100.0,
              child: RaisedButton(
                onPressed: () {

                 Navigator.of(context).pop();
                },
                child: Text(
                  "RE-CALCULATE",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
