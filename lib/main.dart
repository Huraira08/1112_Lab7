import 'package:flutter/material.dart';
import 'package:q1/ReusableWidgets.dart';
import 'package:q1/Constants.dart';

void main() {
  runApp(const BMI());
}

enum gender { male, female }

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  double age = 25;
  double weight = 65;
  double height = 150;
  double currentValue = 150;
  gender? selectedGender;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: cBackgroundColor,
            appBarTheme: AppBarTheme(
              color: cBackgroundColor,
              foregroundColor: Color(0xFFc5c5ca),
            )),
        home: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            title: Text("BMI Calculator"),
            centerTitle: true,
          ),
          body: Column(children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = gender.male;
                          });
                        },
                        child: ReusableWidget(
                          containerColor: selectedGender == gender.male
                              ? cActiveColor
                              : cInactiveColor,
                          nChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  child: Icon(
                                    Icons.male,
                                    size: 70,
                                    color: cMainIconColor,
                                  ),
                                ),
                                Text(
                                  "Male",
                                  style: TextStyle(color: cSubtitleColor),
                                )
                              ]),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = gender.female;
                          });
                        },
                        child: ReusableWidget(
                          containerColor: selectedGender == gender.female
                              ? cActiveColor
                              : cInactiveColor,
                          nChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  child: Icon(
                                    Icons.female_sharp,
                                    size: 70,
                                    color: cMainIconColor,
                                  ),
                                ),
                                Text("Female",
                                    style: TextStyle(color: cSubtitleColor))
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: ReusableWidget(
                      nChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Height",
                                style: TextStyle(color: cSubtitleColor)),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "$height",
                                  style: TextStyle(
                                    color: cMainIconColor,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: "cm",
                                  style: TextStyle(
                                    color: Color(0xFFb5b6c0),
                                  )),
                            ])),
                            Slider(
                              value: currentValue,
                              min: 100,
                              max: 250,
                              divisions: 150,
                              //label: currentValue.round().toString(),
                              onChanged: (value) {
                                setState(() {
                                  currentValue = value;
                                  height = value;
                                });
                              },
                              activeColor: Color(0xFF8b4c66),
                              thumbColor: Color(0xFFe33f66),
                              inactiveColor: Color(0xFF7f7f8d),
                            )
                          ]),
                    ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ReusableWidget(
                          nChild: WeightAgeGetter(
                              value: weight, titleText: "Weight")),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ReusableWidget(
                        nChild: WeightAgeGetter(
                          value: age,
                          titleText: "Age",
                        ),
                      ),
                    )
                  ],
                ),
              ]),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                width: double.maxFinite,

                // height: double.infinity,
                color: Color.fromARGB(255, 232, 61, 102),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Calculate",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Divider(
                            //   color: Color(0xFF6b1e34),
                            //   height: 5,
                            //   thickness: 3,
                            //   indent: 208,
                            //   endIndent: 208,
                            // ),
                            BuildLine(),
                          ]),
                    ),
                  ],
                ),
              ),
            )
          ]),
        )));
  }
}
