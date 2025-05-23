import 'package:flutter/material.dart';
import '../../configs/constant_colors.dart';
import '../../configs/constant_sizes.dart';

class YCDot extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle; // Allow passing a specific style for the title

  const YCDot({Key? key, this.title, this.titleStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // Use headlineSmall or a similar prominent style for "ZEXROSS"
    final defaultNameStyle = textTheme.headlineSmall?.copyWith(
      color: kPrimaryText,
      fontWeight: FontWeight.w600, // SemiBold
    );
    // Use a slightly less prominent or same style for the page title
    final defaultPageTitleStyle = titleStyle ?? textTheme.headlineSmall?.copyWith(
      color: kSecondaryText, // Different color for page title for visual hierarchy
      fontWeight: FontWeight.w500, // Medium
    );

    return Row(
      mainAxisSize: MainAxisSize.min, // Ensure Row takes minimum space
      crossAxisAlignment: CrossAxisAlignment.center, // Align items vertically
      children: <Widget>[
        Text(
          'ZEXROSS',
          style: defaultNameStyle,
        ),
        SizedBox(width: spaceSM), // Use new spacing constant
        Container( // Using Container instead of AnimatedContainer if no animation needed
          height: spaceSM, // 8px
          width: spaceSM,  // 8px
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kAccentColor, // Use accent color for the dot
          ),
        ),
        if (title != null && title!.isNotEmpty) ...[
          SizedBox(width: spaceSM), // Use new spacing constant
          Text(
            title!,
            style: defaultPageTitleStyle,
          ),
        ]
      ],
    );
  }
}
