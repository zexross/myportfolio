import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:myportfolio/responsive_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  List<Widget> navButtons() => [
        NavButton(
          text: 'about',
          onPressed: () {
            html.window.open('https://www.linkedin.com/in/yogesh-choudhary-a38100144/', '_blank');
          },
        ),
        NavButton(
          text: 'blog',
          onPressed: () {
            html.window.open('https://medium.com/@zexross', '_blank');
          },
        ),
        NavButton(
          text: 'contact',
          onPressed: () {
            html.window.open('https://www.linkedin.com/in/yogesh-choudhary-a38100144/', '_blank');
          },
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black,
        ),
        drawer: ResponsiveWidget.isSmallScreen(context)
            ? Drawer(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: navButtons(),
                ),
              )
            : null,
        body: SingleChildScrollView(
          child: AnimatedPadding(
            duration: Duration(seconds: 1),
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
            child: ResponsiveWidget(
              largeScreen: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  NavHeader(navButtons: navButtons()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  ProfileInfo(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  SocialInfo(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavHeader extends StatelessWidget {
  final List<Widget> navButtons;

  const NavHeader({Key key, this.navButtons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: ResponsiveWidget.isSmallScreen(context)
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          YCDot(),
          if(!ResponsiveWidget.isSmallScreen(context))
            Row(
              children: navButtons,
            )
        ],
      ),
    );
  }
}

class YCDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          'ZEXROSS',
          textScaleFactor: 2,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        AnimatedContainer(
          duration: Duration(seconds: 1),
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}

class NavButton extends StatelessWidget {
  final text;
  final onPressed;
  final Color color;

  const NavButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.color = Colors.orange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: Text(text),
      borderSide: BorderSide(
        color: color,
      ),
      onPressed: onPressed,
      highlightedBorderColor: color,
    );
  }
}

class ProfileInfo extends StatelessWidget {
  profileImage(context) => Container(
        height: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.width * 0.25,
        width: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.luminosity,
          color: Colors.deepOrange,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/yc.jpeg'),
            alignment: Alignment.center,
            fit: BoxFit.fill,
          ),
        ),
      );

  final profileData = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Hi there! My name is',
        textScaleFactor: 2,
        style: TextStyle(color: Colors.orange, fontFamily: 'assets/GoogleSansRegular.ttf'),
      ),
      Text(
        'Yogesh\nChoudhary',
        textScaleFactor: 5,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'assets/GoogleSansRegular.ttf'
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'An autonomous driving enthusiast, hardcore programmer and skilled in the field of Artificial Intelligence.\n'
        'Ex-AIESECer having Educational background in Electronics and Computer Engineering\n'
        'and work in multi-disciplinary field.',
        softWrap: true,
        textScaleFactor: 1.5,
        style: TextStyle(color: Colors.white70, fontFamily: 'assets/GoogleSansRegular.ttf'),
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            shape: StadiumBorder(),
            child: Text('Resume'),
            color: Colors.red,
            onPressed: () { 
              html.window.open('https://drive.google.com/file/d/1Uu6jdR9PZ8TOHx_GEg17tCrwLo7J3353/view', '_self');
            },
            padding: EdgeInsets.all(10),
          ),
          SizedBox(
            width: 20,
          ),
          OutlineButton(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            shape: StadiumBorder(),
            child: Text('Say Hi!'),
            color: Colors.red,
            onPressed: () {
              html.window.open('mailto:youzendachoudhary22@gmail.com', '_self');
            },
            padding: EdgeInsets.all(10),
          )
        ],
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[profileImage(context),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
          ), 
        Expanded(child: profileData)],
      ),
      smallScreen: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          profileImage(context),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          profileData
        ],
      ),
    );
  }
}

class SocialInfo extends StatelessWidget {
  List<Widget> socialMediaWidgets() {
    return [
      NavButton(
        text: 'Github',
        onPressed: () {
          html.window.open('https://github.com/zexross', '_blank');
        },
        color: Colors.blue,
      ),
      NavButton(
        text: 'Twitter',
        onPressed: () {
          html.window.open('https://twitter.com/zendacross', '_blank');
        },
        color: Colors.blue,
      ),
      NavButton(
        text: 'Facebook',
        onPressed: () {
          html.window.open('https://www.facebook.com/Yogesh.Choudhary.95', '_blank');
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
