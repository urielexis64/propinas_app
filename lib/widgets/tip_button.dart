import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TipButton extends StatelessWidget {
  const TipButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.active = false,
    this.color = const Color(0xFF00474B),
  }) : super(key: key);

  final Color color;
  final String text;
  final Function() onPressed;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        onPressed: onPressed,
        height: 60,
        color: active ? color.withOpacity(0.7) : color,
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
