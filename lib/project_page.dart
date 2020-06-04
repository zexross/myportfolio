import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:myportfolio/profile_page.dart';
import 'package:myportfolio/project_info.dart';
import 'package:myportfolio/responsive_widget.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key key}) : super(key: key);

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {

  @override
void initState() {
  html.window.history.pushState("", "ProjectPage", "/project");
  super.initState();
}

  List<Widget> navButtons(BuildContext context) => [
        NavButton(
          text: 'about',
          onPressed: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => ProfilePage()), (Route<dynamic> route) => false);
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
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => ProjectPage()), (Route<dynamic> route) => false);
          },
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent
        ),
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
                  ProjectList(),
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
          height: 20,
          width: 4,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.orange,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'Projects',
          textScaleFactor: 2,
          style: TextStyle(
            fontWeight: FontWeight.bold,
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

class ProjectList extends StatelessWidget {
  final List<String> captions = [
    "Deep learning model for MNIST digits",
    "App built on flutter framework",
    "App built using native android",
    "Developed web site on HTML and CSS",
    "Built a light weight yet powerfull Dodeca Copter"
  ];
  final List<String> images = [
    "assets/deepLearningProject.jpg",
    "assets/flutterApp.jpg",
    "assets/androidNativeApp.jpg",
    "assets/webDevelopmentProject.jpg",
    "assets/dodecaCopter.jpg"
  ];
  final List<String> projectDescriptions = [
    """The project was aimed at developing a Neural Network model that is able to recognise the hand digit recognition from scratch and to improve its efficiency by hyper tuning the parameters and other optimisation in the model. We extracted and pre-processed the MNIST Data from Courant Institute, NYU and implemented via Multi-Layer Neural Network, Logistic Regression model and Simple Perceptron model. We thoroughly researched and worked on every model and their functions to figure out what works best for achieving better accuracy.""",
    """I built an interesting game using the flutter framework as my personal project. The game proceeds by asking user the set of questions and then predicting the personality type. The game utilizes complex algorithms to predict the personality type.""",
    """I along with my teammate researched and developed android application to monitor glucose level of the user. The app visualize glucose data in graphical manner and helps the user get better insights about the glucose variation.""",
    """I developed Website as the one of my project during my 2 month summer internship(Jun 2019 - July 2019) at the Linux World Informatics PVT Ltd with the help of HTML and CSS for frontend and python as backend for industry automation by autommating the tasks needed in the IT industry.""",
    """I along with my team built a DodecaCopter for Oprahat competition organized IIT Bombay on December 2017. We utilized the self-designed framework using Palmwood as the material. For Flight Control Board, we used Naze32 and used Betaflight as our Flight Controller Software(Firmware)."""
  ];
  projectImage({BuildContext context, String image, String caption, String projectDescription}) => GridTile(
    child: Hero(
      tag: caption,
          child: GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => ProjectInfo(projectName: caption, projectImage: image, projectDescription: projectDescription,)), (Route<dynamic> route) => false);
            },
                      child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.luminosity,
              color: Colors.deepOrange,
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage(image),
                alignment: Alignment.center,
                fit: BoxFit.fill,
              ),
            ),
        ),
          ),
    ),
      footer: GridTileBar(backgroundColor: Colors.black54,
      title: Text(caption, textAlign: TextAlign.center,),),);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: GridView.builder(
    itemCount: 5,
    shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 3, childAspectRatio: 3/2, crossAxisSpacing: 10, mainAxisSpacing: 10),
    itemBuilder: (BuildContext context, int index) {
      return projectImage(context: context, caption: captions[index], image: images[index], projectDescription: projectDescriptions[index]);
    }),
      smallScreen: GridView.builder(
    itemCount: 5,
    shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 1, childAspectRatio: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
    itemBuilder: (BuildContext context, int index) {
      return projectImage(context: context, caption: captions[index], image: images[index], projectDescription: projectDescriptions[index]);
    }),
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
