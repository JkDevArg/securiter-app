import 'package:flutter/material.dart';

class WTextCustom extends StatelessWidget {
  final String text;
  const WTextCustom({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.black,
          fontSize: 50
      ),
    );
  }
}
