import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../responsive_widget.dart'; // Corrected import path
import 'nav_button.dart'; // Import for NavButton

class SocialInfo extends StatelessWidget {
  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  List<Widget> socialMediaWidgets() {
    return [
      NavButton(
        text: 'Github',
        onPressed: () {
          _launchUrl('https://github.com/zexross');
        },
        color: Colors.blue,
      ),
      NavButton(
        text: 'Twitter',
        onPressed: () {
          _launchUrl('https://twitter.com/yougesh_09');
        },
        color: Colors.blue,
      ),
      NavButton(
        text: 'Facebook',
        onPressed: () {
          _launchUrl('https://www.facebook.com/Yogesh.Choudhary.95');
        },
        color: Colors.blue,
      ),
    ];
  }

  Widget copyRightText() => Text(
        'Yogesh Choudhary ©️2020',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: socialMediaWidgets(),
          ),
          copyRightText(),
        ],
      ),
      smallScreen: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ...socialMediaWidgets(),
          copyRightText(),
        ],
      ),
    );
  }
}
