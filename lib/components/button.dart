import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final Function()? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: onPressed != null
          ? const Color.fromARGB(255, 3, 16, 34)
          : Colors.white24,
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: double.infinity,
        height: 50,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            letterSpacing: 2,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
