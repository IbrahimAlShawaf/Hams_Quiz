import 'package:flutter/material.dart';

Widget buildCard(int index) {
  List donuts = [
    // [ donutFlavor, donutPrice, donutColor, imageName ]
    "assets/images/icecream_donut.png",
    "assets/images/strawberry_donut.png",
    "assets/images/grape_donut.png",
    "assets/images/chocolate_donut.png",
    "assets/images/icecream_donut.png",
    "assets/images/strawberry_donut.png",
    "assets/images/grape_donut.png",
    "assets/images/chocolate_donut.png",
  ];
  List text = [
    "Ice Cream",
    "Strawberry",
    "Grape Ape",
    "Choco",
    "Ice Cream",
    "Strawberry",
    "Grape Ape",
    "Choco",
  ];
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          donuts[index],
          height: 90,
          width: 90,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Text(' ${text[index]}'),
    ],
  );
}
