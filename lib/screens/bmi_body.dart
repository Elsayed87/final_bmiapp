import 'package:final_bmiapp/calculation.dart';
import 'package:final_bmiapp/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  int age = 90;
  int weight = 60;
  int height = 180;
  bool male = true;
  bool female = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'BMI Calculator'.toUpperCase(),
            style: kAppBarTextStyle,
          ),
          centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.mars,
                          size: 45,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'male'.toUpperCase(),
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    colour: male ? kActiveCardColor : kInActiveCardColor,
                    OnTap: () {
                      setState(() {
                        male = !male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      colour: female ? kActiveCardColor : kInActiveCardColor,
                      OnTap: () {
                        setState(() {
                          female = !female;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.venus,
                            size: 45,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'female'.toUpperCase(),
                            style: kLabelTextStyle,
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                colour: kActiveCardColor,
                OnTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'height'.toUpperCase(),
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm'.toUpperCase(),
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.pinkAccent,
                        inactiveTrackColor: Colors.blueGrey,
                        thumbColor: Colors.pinkAccent,
                        overlayColor: const Color(0x29f06292),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            height = value.round();
                          });
                        },
                        max: 250,
                        min: 30,
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    OnTap: () {},
                    child: Column(
                      children: [
                        Text(
                          'weight'.toUpperCase(),
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            RoundedIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                })
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    OnTap: () {},
                    child: Column(
                      children: [
                        Text(
                          'age'.toUpperCase(),
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            RoundedIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Result result=Result(weight: weight,height: height);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultScreen(
                            bmi: result.getResult(),
                            result:result.getData(),
                            recomendation: result.getRecomendation(),
                          )));
              setState(() {});
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 8),
              height: 38,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25))),
              child: Text(
                'calculate'.toUpperCase(),
                style: kLabelTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Widget child;
  final Color colour;
  final VoidCallback OnTap;
  ReusableCard(
      {required this.child, required this.colour, required this.OnTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTap,
      child: Container(
        child: child,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(6.0),
        ),
        margin: EdgeInsets.all(10.0),
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({required this.onPressed, required this.icon});
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: Colors.grey,
      shape: CircleBorder(),
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(height: 56, width: 56),
    );
  }
}
