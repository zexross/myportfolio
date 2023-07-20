import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:myportfolio/profile_page.dart';
import 'package:myportfolio/project_page.dart';
import 'package:myportfolio/responsive_widget.dart';

class ProjectInfo extends StatefulWidget {
  const ProjectInfo(
      {Key? key, this.projectName, this.projectDescription, this.projectImage})
      : super(key: key);
  final String? projectName;
  final String? projectImage;
  final String? projectDescription;
  @override
  _ProjectInfoState createState() => _ProjectInfoState();
}

class _ProjectInfoState extends State<ProjectInfo> {
  @override
  void initState() {
    html.window.history
        .pushState("", "ProjectInfo", "/project/${widget.projectName}");
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
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 400,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  widget.projectName ?? '',
                ),
                background: Hero(
                  tag: widget.projectName ?? '',
                  child:
                      Image.asset(widget.projectImage ?? '', fit: BoxFit.cover),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  AnimatedPadding(
                    duration: Duration(seconds: 1),
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.1),
                    child: ResponsiveWidget(
                      largeScreen: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          NavHeader(navButtons: navButtons(context)),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                          ProjectDescription(
                              projectDescription: widget.projectDescription),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                          ),
                          SocialInfo(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
          Description(),
          if (!ResponsiveWidget.isSmallScreen(context))
            Row(
              children: navButtons,
            )
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          'Description',
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
      ),
      onPressed: onPressed,
    );
  }
}

class ProjectDescription extends StatelessWidget {
  final projectDescription;
  ProjectDescription({@required this.projectDescription});
  projectDetail(projectDescription) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            """$projectDescription""",
            softWrap: true,
            textScaleFactor: 1.5,
            style: TextStyle(
                color: Colors.white70,
                fontFamily: 'assets/GoogleSansRegular.ttf'),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: projectDetail(projectDescription),
      smallScreen: projectDetail(projectDescription),
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
