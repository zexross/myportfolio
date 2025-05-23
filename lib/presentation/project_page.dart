import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myportfolio/configs/constant_strings.dart';
import '../responsive_widget.dart';
import '../routing/routes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:myportfolio/presentation/widgets/widgets.dart';
import '../configs/constant_colors.dart';
import '../configs/constant_sizes.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
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
            // Already on projects page, do nothing or refresh
          },
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Scaffold(
        // backgroundColor will be inherited from ThemeData -> kPrimaryBackground
        appBar: AppBar(
          backgroundColor: kPrimaryBackground, // Or Colors.transparent if preferred
          elevation: 0, // No shadow for a cleaner look
          title: ResponsiveWidget.isSmallScreen(context) ? YCDot(title: "Projects") : null, // Show title in AppBar on small screens
          automaticallyImplyLeading: ResponsiveWidget.isSmallScreen(context), // Show drawer icon on small screens
        ),
        drawer: ResponsiveWidget.isSmallScreen(context)
            ? Drawer(
                backgroundColor: kSurfaceColor,
                child: ListView(
                  padding: EdgeInsets.all(spaceMD),
                  children: navButtons(context),
                ),
              )
            : null,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: spaceXL, vertical: spaceLG),
            child: ResponsiveWidget(
              largeScreen: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (!ResponsiveWidget.isSmallScreen(context)) // NavHeader for large screens
                    NavHeader(navButtons: navButtons(context), pageTitle: "Projects"),
                  SizedBox(height: spaceXL),
                  ProjectList(),
                  SizedBox(height: spaceXXL),
                  SocialInfo(),
                  SizedBox(height: spaceLG), // Footer padding
                ],
              ),
              smallScreen: Column( // Content for small screens, AppBar handles title/drawer
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: spaceLG), // Initial padding from AppBar
                  ProjectList(),
                  SizedBox(height: spaceXL),
                  SocialInfo(),
                  SizedBox(height: spaceLG), // Footer padding
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
  Widget projectCard({ // Renamed from projectImage for clarity
    required BuildContext context,
    required String image,
    required String heroTag,
    required String caption,
    // required String projectDescription, // Not used in card, but in detail
  }) {
    final textTheme = Theme.of(context).textTheme;
    return Hero(
      tag: caption, // Use caption as tag, assuming it's unique. heroTag can be used if different.
      child: GestureDetector(
        onTap: () {
          context.goNamed(Routes.projectDetail.name,
              pathParameters: {'projectTag': heroTag});
        },
        child: Card(
          color: kSurfaceColor,
          elevation: 0, // Handled by container shadow if any, or keep minimal
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(spaceSM),
          ),
          clipBehavior: Clip.antiAlias, // Ensures image respects border radius
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Optional: add a subtle inner shadow or gradient if needed for text legibility over images
                ),
              ),
              Container(
                padding: EdgeInsets.all(spaceMD),
                color: kSurfaceColor, // Or kChipBackground for a slightly different shade
                child: Text(
                  caption,
                  style: textTheme.titleMedium?.copyWith(color: kPrimaryText),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Adjust aspect ratio for better card appearance with the new layout
    double aspectRatio = ResponsiveWidget.isLargeScreen(context) ? 4/3 : 3/2;
    if (ResponsiveWidget.isSmallScreen(context)) {
      aspectRatio = 4/3; // Or even 16/9 for small screens if images allow
    }


    return ResponsiveWidget(
      largeScreen: GridView.builder(
        itemCount: ksShowcaseProjects.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(), // GridView inside SingleChildScrollView
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: aspectRatio,
          crossAxisSpacing: spaceLG, // Increased spacing
          mainAxisSpacing: spaceLG,   // Increased spacing
        ),
        itemBuilder: (BuildContext context, int index) {
          final project = ksShowcaseProjects[index];
          return projectCard(
            context: context,
            caption: project.title,
            image: project.image,
            heroTag: project.heroTag,
            // projectDescription: project.description,
          );
        },
      ),
      mediumScreen: GridView.builder( // Added mediumScreen for 2 columns
        itemCount: ksShowcaseProjects.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: aspectRatio,
          crossAxisSpacing: spaceMD,
          mainAxisSpacing: spaceMD,
        ),
        itemBuilder: (BuildContext context, int index) {
          final project = ksShowcaseProjects[index];
          return projectCard(
            context: context,
            caption: project.title,
            image: project.image,
            heroTag: project.heroTag,
          );
        },
      ),
      smallScreen: GridView.builder(
        itemCount: ksShowcaseProjects.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: aspectRatio, // Can be different for small screens
          crossAxisSpacing: spaceMD,
          mainAxisSpacing: spaceMD,
        ),
        itemBuilder: (BuildContext context, int index) {
          final project = ksShowcaseProjects[index];
          return projectCard(
            context: context,
            caption: project.title,
            image: project.image,
            heroTag: project.heroTag,
          );
        },
      ),
    );
  }
}
