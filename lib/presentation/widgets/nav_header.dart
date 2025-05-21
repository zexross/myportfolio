import 'package:flutter/material.dart';
import '../../responsive_widget.dart'; // Corrected import path
import 'yc_dot.dart'; 

class NavHeader extends StatelessWidget {
  final List<Widget> navButtons;
  final String? pageTitle;

  const NavHeader({Key? key, required this.navButtons, this.pageTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: ResponsiveWidget.isSmallScreen(context)
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          YCDot(title: pageTitle), // Pass pageTitle to YCDot
          if (!ResponsiveWidget.isSmallScreen(context))
            Row(
              children: navButtons,
            )
        ],
      ),
    );
  }
}
