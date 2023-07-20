import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:myportfolio/project_page.dart';
import 'package:myportfolio/responsive_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    html.window.history.pushState("", "ProfilePage", "/");
    super.initState();
  }

  List<Widget> navButtons(BuildContext context) => [
        NavButton(
          text: 'about',
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => ProfilePage()));
          },
        ),
        NavButton(
          text: 'blog',
          onPressed: () {
            html.window.open('https://medium.com/@zexross', '_blank');
          },
        ),
        NavButton(
          text: 'projects',
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => ProjectPage()));
          },
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Scaffold(
        backgroundColor: Colors.black,
        drawer: ResponsiveWidget.isSmallScreen(context)
            ? Drawer(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: navButtons(context),
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
                  NavHeader(navButtons: navButtons(context)),
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

  const NavHeader({Key? key, required this.navButtons}) : super(key: key);

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
          if (!ResponsiveWidget.isSmallScreen(context))
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
      {Key? key,
      required this.text,
      required this.onPressed,
      this.color = Colors.orange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text(text),
      style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: color,
          ),
          foregroundColor: Colors.white),
      onPressed: onPressed,
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
            image: AssetImage('assets/me.jpeg'),
            alignment: Alignment.center,
            fit: BoxFit.fill,
          ),
        ),
      );

  final profileData = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Hi there! I am Yogesh',
        textScaleFactor: 2,
        style: TextStyle(
            color: Colors.orange, fontFamily: 'assets/GoogleSansRegular.ttf'),
      ),
      Text(
        'Machine learning Engineer: Discovering new ways to tackle the problems via ML | Author and Editor at raywenderlich.com',
        textScaleFactor: 2,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'assets/GoogleSansRegular.ttf'),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        """Primarily a machine learning engineer but also has good experience in app development and embedded system. I am passionate about learning, sharing, discussing technologies and exploring. I love coding for hours and have a very high bias in the field of vehicle automation due to the complexity and challenges involved in achieving level 5 autonomy.

Out of my coding life, I work on polishing my skills, actively sharing my knowledge by writing and editing articles, dismantling and again rebuilding the hardware around me, playing football and watching anime.

My achiements:
 - Researched and built the complex machine learning models as my side projects.
 - Honored with first prize in the Jazbaa1.0 hackathon organized by IIEC community on July 2019 for developing and pitching a vision aid with AI prototype.
 - Founded the AI club in my college on November 2019 and currently coordinating it
 - Successfully served the AIESEC, a non-profit youth run organization for 6 months duration as Incoming Global Talent member from Aug 2018 – Jan 2019. 
 
I am skilled in machine learning, app development(via flutter), and robotics. """,
        softWrap: true,
        textScaleFactor: 1.2,
        style: TextStyle(
            color: Colors.white70, fontFamily: 'assets/GoogleSansRegular.ttf'),
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              padding: EdgeInsets.all(10),
            ),
            child: Text('Resume'),
            onPressed: () {
              html.window.open(
                  'https://drive.google.com/file/d/1NfZssTc8ar055eyAtlCT8E-lyDVtf0mj/view',
                  '_self');
            },
          ),
          SizedBox(
            width: 20,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Colors.red,
                ),
                shape: StadiumBorder(),
                foregroundColor: Colors.white,
                padding: EdgeInsets.all(10)),
            child: Text('Say Hi!'),
            onPressed: () {
              html.window.open('mailto:youzendachoudhary22@gmail.com', '_self');
            },
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
        children: <Widget>[
          profileImage(context),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
          ),
          Expanded(child: profileData)
        ],
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
          html.window.open('https://twitter.com/yougesh_09', '_blank');
        },
        color: Colors.blue,
      ),
      NavButton(
        text: 'Facebook',
        onPressed: () {
          html.window
              .open('https://www.facebook.com/Yogesh.Choudhary.95', '_blank');
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
