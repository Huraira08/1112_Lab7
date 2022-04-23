import 'package:flutter/material.dart';
import 'package:q1/Constants.dart';

class ReusableWidget extends StatelessWidget {
  const ReusableWidget({
    this.nHeight = cContainerHeight,
    this.nWidth = 0,
    required this.nChild,
    this.containerColor = cActiveColor,
    Key? key,
  }) : super(key: key);
  final double nHeight;
  final double nWidth;
  final Widget nChild;
  final containerColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: nHeight,
      width: 100,
      decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.all(Radius.circular(7))),
      child: nChild,
    );
  }
}

class WeightAgeGetter extends StatefulWidget {
  WeightAgeGetter({Key? key, required this.value, required this.titleText})
      : super(key: key);

  String titleText;
  double value;

  @override
  State<WeightAgeGetter> createState() => _WeightAgeGetterState();
}

class _WeightAgeGetterState extends State<WeightAgeGetter> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.titleText, style: TextStyle(color: cSubtitleColor)),
          Text("${widget.value}",
              style: TextStyle(
                  color: cMainIconColor,
                  fontSize: 35,
                  fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FloatingActionButton.small(
                onPressed: () {
                  setState(() {
                    widget.value--;
                  });
                },
                child: Icon(
                  Icons.remove,
                  size: 30,
                ),
                backgroundColor: cActionButtonColor,
                foregroundColor: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton.small(
                onPressed: () {
                  setState(() {
                    widget.value++;
                  });
                },
                child: Icon(
                  Icons.add,
                  size: 30,
                ),
                backgroundColor: cActionButtonColor,
                foregroundColor: Colors.white,
              )
            ],
          )
        ]);
  }
}

Widget BuildLine() => Center(
      child: Container(
        height: 3,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 107, 30, 52),
        ),
      ),
    );
