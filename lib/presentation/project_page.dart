import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myportfolio/configs/constant_strings.dart';
import '../responsive_widget.dart'; // Changed to relative import
import '../routing/routes.dart'; // Changed to relative import
import 'package:url_launcher/url_launcher.dart';
import 'package:myportfolio/presentation/widgets/widgets.dart'; // Import new widgets

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
                  NavHeader(navButtons: navButtons(context), pageTitle: "Projects"),
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
                // shape: BoxShape.rectangle, // Already default for Container, borderRadius needs it to be non-circular
                borderRadius: BorderRadius.circular(8.0), // Added rounded corners
                image: DecorationImage(
                  image: AssetImage(image),
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                ),
                boxShadow: [ // Added subtle shadow
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
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
