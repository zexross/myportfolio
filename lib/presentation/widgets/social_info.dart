import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../responsive_widget.dart';
import 'nav_button.dart'; // NavButton is already refactored
import '../../configs/constant_colors.dart';
import '../../configs/constant_sizes.dart';

class SocialInfo extends StatelessWidget {
  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  List<Widget> socialMediaWidgets(BuildContext context) { // Added context
    // NavButtons are already styled, no need for explicit color here
    return [
      NavButton(
        text: 'Github',
        onPressed: () => _launchUrl('https://github.com/zexross'),
      ),
      NavButton(
        text: 'Twitter',
        onPressed: () => _launchUrl('https://twitter.com/yougesh_09'),
      ),
      NavButton(
        text: 'LinkedIn', // Changed from Facebook to LinkedIn as it's more professional
        onPressed: () => _launchUrl('https://www.linkedin.com/in/yogesh-choudhary-220a92148/'),
      ),
      NavButton(
        text: 'Medium', // Added Medium
        onPressed: () => _launchUrl('https://medium.com/@zexross'),
      ),
    ];
  }

  Widget copyRightText(BuildContext context) { // Added context
    final textTheme = Theme.of(context).textTheme;
    return Text(
      'Yogesh Choudhary ©️${DateTime.now().year}', // Dynamic year
      textAlign: TextAlign.center,
      style: textTheme.bodySmall?.copyWith(color: kSecondaryText), // Caption like style
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> socials = socialMediaWidgets(context);

    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: socials.map((button) => Padding(
              padding: EdgeInsets.only(right: spaceSM), // Spacing between social buttons
              child: button,
            )).toList(),
          ),
          copyRightText(context),
        ],
      ),
      smallScreen: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Center items on small screen
        children: <Widget>[
          Wrap( // Use Wrap for better layout on small screens
            alignment: WrapAlignment.center,
            spacing: spaceSM,
            runSpacing: spaceSM,
            children: socials,
          ),
          SizedBox(height: spaceMD),
          copyRightText(context),
        ],
      ),
    );
  }
}
