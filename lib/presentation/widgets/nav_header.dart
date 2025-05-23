import 'package:flutter/material.dart';
import '../../responsive_widget.dart';
import 'yc_dot.dart';
import '../../configs/constant_sizes.dart'; // Import new size constants
import '../../configs/constant_colors.dart'; // Import new color constants

class NavHeader extends StatelessWidget {
  final List<Widget> navButtons;
  final String? pageTitle;

  const NavHeader({Key? key, required this.navButtons, this.pageTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          YCDot(
            title: pageTitle,
            // YCDot title styling will be handled within its own widget,
            // but if it were here, it would be like:
            // titleStyle: textTheme.headlineSmall?.copyWith(color: kPrimaryText),
          ),
          if (!ResponsiveWidget.isSmallScreen(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: navButtons.map((button) {
                return Padding(
                  padding: EdgeInsets.only(left: spaceMD), // Spacing between nav buttons
                  child: button,
                );
              }).toList(),
            )
        ],
      ),
      smallScreen: Column( // For small screens, stack them or use a drawer
        children: <Widget>[
          YCDot(
            title: pageTitle,
            // titleStyle: textTheme.headlineSmall?.copyWith(color: kPrimaryText),
          ),
          SizedBox(height: spaceMD),
          Wrap( // Use Wrap for nav buttons on small screens if not using a drawer
            alignment: WrapAlignment.center,
            spacing: spaceSM,
            runSpacing: spaceSM,
            children: navButtons,
          )
        ],
      ),
    );
  }
}
