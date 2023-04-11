import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/widgets/text_util.dart';

Widget buildCard(int index) {
  List donuts = [
    "assets/images/one.png",
    "assets/images/two.png",
    "assets/images/three.png",
    "assets/images/four.png",
    "assets/images/one.png",
    "assets/images/two.png",
    "assets/images/three.png",
    "assets/images/four.png",
  ];
  List text = [
    "Haircare",
    "Skincare",
    "Lip Stick",
    "Nail Art",
    "Haircare",
    "Skincare",
    "Lip Stick",
    "Nail Art",
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
