import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myportfolio/configs/constant_strings.dart';
import 'package:myportfolio/responsive_widget.dart';
import 'package:myportfolio/routing/routes.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  void initState() {
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
            context.goNamed(Routes.project.name);
          },
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(backgroundColor: Colors.transparent),
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
      {Key? key,
      @required this.text,
      @required this.onPressed,
      this.color = Colors.orange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        child: Text(text),
        style: OutlinedButtonTheme.of(context).style?.copyWith(
              side: MaterialStatePropertyAll(
                BorderSide(
                  color: color,
                ),
              ),
            ),
        onPressed: onPressed);
  }
}

class ProjectList extends StatelessWidget {
  projectImage(
          {required BuildContext context,
          required String image,
          required String heroTag,
          required String caption,
          required String projectDescription}) =>
      GridTile(
        child: Hero(
          tag: caption,
          child: GestureDetector(
            onTap: () {
              context.goNamed(Routes.projectDetail.name,
                  pathParameters: {'projectTag': heroTag});
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
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(
            caption,
            textAlign: TextAlign.center,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: GridView.builder(
          itemCount: ksShowcaseProjects.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (BuildContext context, int index) {
            final showCaseProject = ksShowcaseProjects;
            return projectImage(
                context: context,
                caption: showCaseProject[index].title,
                image: showCaseProject[index].image,
                heroTag: showCaseProject[index].heroTag,
                projectDescription: showCaseProject[index].description);
          }),
      smallScreen: GridView.builder(
          itemCount: ksShowcaseProjects.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (BuildContext context, int index) {
            final showCaseProject = ksShowcaseProjects;
            return projectImage(
                context: context,
                caption: showCaseProject[index].title,
                image: showCaseProject[index].image,
                heroTag: showCaseProject[index].heroTag,
                projectDescription: showCaseProject[index].description);
          }),
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
