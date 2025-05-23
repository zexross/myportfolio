import 'package:flutter/material.dart';
import '../../configs/constant_colors.dart';
import '../../configs/constant_sizes.dart';

class NavButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const NavButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  _NavButtonState createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final Color textColor = _isHovered ? kAccentColor : kSecondaryText;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: spaceMD, vertical: spaceSM),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(spaceXS), // Subtle rounding
          ),
          // No background or border by default
        ),
        child: Text(
          widget.text,
          style: textTheme.labelLarge?.copyWith(
            color: textColor,
            fontWeight: FontWeight.w500, // Medium weight
          ),
        ),
      ),
    );
  }
}
