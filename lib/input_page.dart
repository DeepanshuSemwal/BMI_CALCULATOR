

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/icon_content.dart';
import 'package:bmicalculator/reusable_card.dart';
import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/result_page.dart';
import 'package:bmicalculator/round_icon_button.dart';
import 'package:bmicalculator/calculate_brain.dart';


enum Gender
{
  male,
  female
}




class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor=KinactiveCardColor;
  Color femaleCardColor=KinactiveCardColor;
  Gender selectedGender=Gender.male;

  int height=180;
  int weight =60;
  int age=19;




  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Center
          (
          child: Text(
            "BMI CALCULATOR",

          ),
        ),
        backgroundColor: Colors.black87,

      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector
                    (
                    onTap:()
                    {
                      setState(()
                      {
                        selectedGender=Gender.male;

                      }

                      );
                    },
                    child: ReusabaleCard(
                      colour: selectedGender==Gender.male?KactiveCardColor:KinactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "MALE",
                      ),
                    ),
                  ),

                ),



                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(

                          onTap: (){
                            setState(()
                            {
                              selectedGender=Gender.female;
                            }

                            );
                          },
                          child: ReusabaleCard(
                            colour: selectedGender==Gender.female?KactiveCardColor:KinactiveCardColor,
                            cardChild: IconContent(
                              label: "FEMALE",
                              icon: FontAwesomeIcons.venus,
                            ),
                          ),
                        ),

                      ),

                    ],


                  ),

                ),



              ],

            ),

          ),

          Expanded(

            child: ReusabaleCard(
             colour: KactiveCardColor,

              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",

                    style: KlabelTextStyle,

                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,

                    children: <Widget>[
                      Text(

                        height.toString(),
                        style: KnumberTextStyle,
                      ),
                      Text(
                        'cm',
                      ),
                      SliderTheme
                        (
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                          max: 220.0,
                            activeColor: Color(0xFFEB1555),
                            inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },

                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ),

          ),



          Expanded(

            child: Row(
              children: <Widget>[
                Expanded(

                  child: ReusabaleCard(
                    colour: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: KlabelTextStyle,
                        ),
                        Text
                          (
                            weight.toString(),
                          style: KnumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget> [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(

                                      () {
                                        weight++;

                                  },
                                );
                              },
                            ),


                            SizedBox(
                              width: 10.0,
                            ),
                           RoundIconButton
                             (
                               icon: FontAwesomeIcons.minus,
                             onPressed: (){
                                 setState(()
                                     {
                                       weight--;
                                     }


                                 );
                             },
                           ),



                          ],


                        ),




                      ],
                    ),
                  ),

                ),

                Expanded(

                  child: ReusabaleCard(
                    colour: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: KlabelTextStyle,
                        ),
                        Text
                          (
                          age.toString(),
                          style: KnumberTextStyle,

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            RoundIconButton
                              (
                                icon: FontAwesomeIcons.plus,
                                onPressed: ()
                                {
                                  setState(()
                                  {
                                    age++;
                                  }

                                  );
                                }
                            ),
                            SizedBox
                              (
                                width: 10.0,

                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed:()
                                {
                                    setState(()
                                        {
                                          age--;
                                        }

                                    );
                                }

                            ),

                          ],
                        )

                      ],
                    ),


                  ),

                ),


              ],

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

                  CalculatorBmi calc =
                  CalculatorBmi(height: height, weight: weight);
                   Navigator.push(context,  MaterialPageRoute(builder: (context)=>ResultPage(bmiResult: calc.calculateBMI(),
                     resultText: calc.getResult(),
                     interpretation: calc.getInterpretation(),)));
                },
                child: Text(
                  "CALCULATE",
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






