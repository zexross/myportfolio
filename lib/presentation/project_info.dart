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
                          // Display shortDescription
                          if (showcaseProject.shortDescription.isNotEmpty) ...[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Added padding
                              child: Text(
                                showcaseProject.shortDescription,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white.withOpacity(0.85), // Slightly more opaque
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                          ],
                          ProjectDescription(
                              projectDescription: showcaseProject.description),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05, // Adjusted spacing
                          ),
                          // Display other project info fields
                          Padding( // Added padding around the sections
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: _buildProjectInfoSections(context, showcaseProject),
                          ),
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

  Widget _buildProjectInfoSections(
      BuildContext context, ShowcaseProject project) {
    final List<Widget> sections = [];

    // Helper to create a section for ProjectInfoField
    void addProjectInfoFieldSection(ProjectInfoField field) {
      if (field.contents.isNotEmpty) {
        sections.add(SizedBox(height: 20)); // Increased spacing
        sections.add(Row(
          crossAxisAlignment: CrossAxisAlignment.center, // Align icon and text
          children: [
            if (field.icon != null) ...[ // Check if icon data is available
              Icon(field.icon, color: Colors.white, size: 24), // Added size and color
              SizedBox(width: 10), // Increased spacing
            ],
            Text(field.label,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)), // Increased size
          ],
        ));
        sections.add(SizedBox(height: 12)); // Increased spacing

        if (field.isTag == true) {
          sections.add(Wrap(
            spacing: 8.0,
            runSpacing: 6.0, // Increased spacing
            children: field.contents
                .map((tag) => Chip(
                      label: Text(tag),
                      backgroundColor: Colors.orangeAccent.withOpacity(0.85), // Adjusted color
                      labelStyle: TextStyle(color: Colors.black, fontSize: 14), // Adjusted style
                      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0), // Added padding
                    ))
                .toList(),
          ));
        } else if (field.isLink == true) {
          sections.add(Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: field.contents
                .map((linkUrl) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0), // Increased spacing
                      child: InkWell(
                        onTap: () => _launchUrl(linkUrl), // _launchUrl is in _ProjectInfoState
                        child: Text(linkUrl,
                            style: TextStyle(
                                color: Colors.lightBlueAccent, // Adjusted color
                                decoration: TextDecoration.underline,
                                fontSize: 16)),
                      ),
                    ))
                .toList(),
          ));
        } else { // Plain text content
          sections.add(Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: field.contents
                .map((textContent) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0), // Increased spacing
                      child: Text(textContent,
                          style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.9))), // Adjusted style
                    ))
                .toList(),
          ));
        }
      }
    }

    // Add sections for each ProjectInfoField
    addProjectInfoFieldSection(project.tech);
    addProjectInfoFieldSection(project.platform);
    addProjectInfoFieldSection(project.author);
    addProjectInfoFieldSection(project.link);
    
    // Handle ShowcaseProject.tags (List<String>) separately as it's not a ProjectInfoField
    if (project.tags.isNotEmpty) {
      sections.add(SizedBox(height: 20)); // Increased spacing
      sections.add(Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon(Icons.local_offer_outlined, color: Colors.white, size: 24), // Example icon for general tags
          // SizedBox(width: 10),
          Text("General Tags", // Label for this section
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)), // Increased size
        ],
      ));
      sections.add(SizedBox(height: 12)); // Increased spacing
      sections.add(Wrap(
        spacing: 8.0,
        runSpacing: 6.0, // Increased spacing
        children: project.tags
            .map((tag) => Chip(
                  label: Text(tag),
                  backgroundColor: Colors.tealAccent.withOpacity(0.85), // Different color for project tags
                  labelStyle: TextStyle(color: Colors.black, fontSize: 14), // Adjusted style
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0), // Added padding
                ))
            .toList(),
      ));
    }

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: sections);
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
          textScaler: TextScaler.linear(2),
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
            textScaler: TextScaler.linear(1.5),
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
