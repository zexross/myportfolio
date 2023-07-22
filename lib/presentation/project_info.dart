import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myportfolio/configs/configs.dart';
import 'package:myportfolio/model/showcase_project.dart';
import 'package:myportfolio/responsive_widget.dart';
import 'package:myportfolio/routing/routes.dart';
import 'package:url_launcher/url_launcher.dart';

import 'project_page.dart';

class ProjectInfo extends StatefulWidget {
  const ProjectInfo({Key? key, required this.projectTag}) : super(key: key);
  final String projectTag;
  @override
  _ProjectInfoState createState() => _ProjectInfoState();
}

class _ProjectInfoState extends State<ProjectInfo> {
  late final ShowcaseProject showcaseProject;
  void initState() {
    showcaseProject = ksShowcaseProjects
        .firstWhere((element) => element.heroTag == widget.projectTag);
    super.initState();
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  List<Widget> navButtons(BuildContext context) => [
        NavButton(
          text: 'about',
          onPressed: () {
            context.goNamed(Routes.home.name);
          },
        ),
        NavButton(
          text: 'blog',
          onPressed: () {
            _launchUrl('https://medium.com/@zexross');
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
                  showcaseProject.title,
                ),
                background: Hero(
                  tag: showcaseProject.heroTag,
                  child: Image.asset(showcaseProject.image, fit: BoxFit.cover),
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
                              projectDescription: showcaseProject.description),
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
          _launchUrl('https://twitter.com/zendacross');
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
