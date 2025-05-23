import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:myportfolio/presentation/widgets/widgets.dart';
import '../responsive_widget.dart';
import '../routing/routes.dart';
import '../configs/constant_colors.dart';
import '../configs/constant_sizes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
            // Potentially scroll to an about section or do nothing if already on profile
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
        // backgroundColor will be inherited from ThemeData -> kPrimaryBackground
        drawer: ResponsiveWidget.isSmallScreen(context)
            ? Drawer(
                backgroundColor: kSurfaceColor, // Drawer background
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
                  NavHeader(navButtons: navButtons(context)),
                  SizedBox(height: spaceXL),
                  ProfileInfo(),
                  SizedBox(height: spaceXXL),
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

class ProfileInfo extends StatelessWidget {
  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget profileImage(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double imageSize;

    if (ResponsiveWidget.isSmallScreen(context)) {
      imageSize = screenWidth * 0.4;
    } else if (ResponsiveWidget.isMediumScreen(context)) {
      imageSize = screenWidth * 0.3;
    } else {
      imageSize = screenWidth * 0.20; // Slightly smaller for large screens
    }
    imageSize = imageSize.clamp(120.0, 280.0); // Adjusted clamp values

    return Container(
      height: imageSize,
      width: imageSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: kAccentColor, width: 2), // Subtle border
        image: DecorationImage(
          image: AssetImage('assets/me.jpeg'),
          alignment: Alignment.center,
          fit: BoxFit.cover, // Changed to cover
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final profileData = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Hi there! I'm Yogesh",
          style: textTheme.headlineMedium?.copyWith(color: kPrimaryText),
        ),
        SizedBox(height: spaceSM),
        Text(
          'Machine learning Engineer: Discovering new ways to tackle the problems via ML | Author and Editor at raywenderlich.com',
          style: textTheme.titleLarge?.copyWith(color: kSecondaryText, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: spaceLG),
        Text(
          "SUMMARY",
          style: textTheme.headlineSmall?.copyWith(color: kPrimaryText),
        ),
        SizedBox(height: spaceSM),
        Text(
          "Experienced Backend and AI Engineer with 6 years of experience in developing and deploying AI-powered products, ranging from innovative code\ngeneration tools (used by 25,000 developers at Welltested AI) to real-time glucose monitoring systems.\nProven ability to architect complex systems, including microservices architectures and RAG pipelines. Seeking a role in a high-velocity startup tackling\nchallenging engineering problems.",
          softWrap: true,
          style: textTheme.bodyMedium?.copyWith(color: kSecondaryText, height: 1.6),
        ),
        SizedBox(height: spaceLG),
        Text(
          "SKILLS",
          style: textTheme.headlineSmall?.copyWith(color: kPrimaryText),
        ),
        SizedBox(height: spaceMD),
        Wrap(
          spacing: spaceSM,
          runSpacing: spaceSM,
          children: [
            "Solutions Architect", "Backend Development", "Machine Learning", "Deep Learning",
            "Transformers", "LSTM", "CNN", "RNN", "GAN", "RAG", "Reinforcement Learning",
            "Database", "Vector DB", "Tensorflow", "Pytorch", "LangChain", "Prompt Engineering",
            "Flutter", "Dart", "Python", "Golang", "C++", "LLM", "LLaMA",
            "MLOps", "Docker", "Leadership", "Problem Solving", "Research"
          ]
              .map((skill) => Chip(
                    label: Text(skill),
                    backgroundColor: kChipBackground,
                    labelStyle: textTheme.bodySmall?.copyWith(color: kPrimaryText),
                    padding: EdgeInsets.symmetric(horizontal: spaceSM, vertical: spaceXS),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(spaceSM),
                      side: BorderSide.none, // Ensure no default border
                    ),
                  ))
              .toList(),
        ),
        SizedBox(height: spaceXL),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: spaceMD,
          runSpacing: spaceMD,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kAccentColor,
                foregroundColor: kPrimaryText,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(spaceSM)),
                padding: EdgeInsets.symmetric(horizontal: spaceLG, vertical: spaceMD),
                textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              child: Text('Resume'),
              onPressed: () {
                _launchUrl(
                    'https://drive.google.com/file/d/1_ikLaMKd0MkffxyDXh7kWwZKSSBxB3i4/view?usp=sharing');
              },
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: kAccentColor, width: 1.5),
                foregroundColor: kAccentColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(spaceSM)),
                padding: EdgeInsets.symmetric(horizontal: spaceLG, vertical: spaceMD),
                textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              child: Text('Say Hi!'),
              onPressed: () {
                _launchUrl('mailto:youzendachoudhary22@gmail.com');
              },
            )
          ],
        )
      ],
    );

    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Align content to the start
        crossAxisAlignment: CrossAxisAlignment.start, // Align items to the top
        children: <Widget>[
          profileImage(context),
          SizedBox(width: spaceXL), // Use new spacing constant
          Expanded(child: profileData)
        ],
      ),
      smallScreen: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          profileImage(context),
          SizedBox(height: spaceLG), // Use new spacing constant
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spaceMD), // Use new spacing constant
            child: profileData,
          )
        ],
      ),
    );
  }
}
