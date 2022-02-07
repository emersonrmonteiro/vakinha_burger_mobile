import 'package:flutter/material.dart';

class VakinhaRoudedButton extends StatelessWidget {
  final VoidCallback onPressd;
  final String label;
  final double? fontSize;
  const VakinhaRoudedButton({
    Key? key,
    required this.onPressd,
    required this.label,
    this.fontSize = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressd,
      child: Text(
        label,
        style: TextStyle(color: Colors.grey, fontSize: fontSize),
      ),
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), primary: Colors.white),
    );
  }
}
