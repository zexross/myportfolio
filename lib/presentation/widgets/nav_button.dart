import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final String text; // Explicitly typed
  final VoidCallback onPressed; // Explicitly typed and corrected name
  final Color color;

  const NavButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.orange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text(text),
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: color,
        ),
        foregroundColor: Colors.white, // Explicitly set for consistency
      ),
      onPressed: onPressed,
    );
  }
}
