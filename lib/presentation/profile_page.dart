import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:myportfolio/presentation/widgets/widgets.dart'; // Import new widgets

import '../responsive_widget.dart';
import '../routing/routes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          onPressed: () {},
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

class ProfileInfo extends StatelessWidget {
  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  profileImage(BuildContext context) {
    // Added BuildContext type
    final screenWidth = MediaQuery.of(context).size.width;
    double imageSize;

    if (ResponsiveWidget.isSmallScreen(context)) {
      imageSize =
          screenWidth * 0.4; // Adjusted for small screens (e.g., 40% of width)
    } else if (ResponsiveWidget.isMediumScreen(context)) {
      imageSize =
          screenWidth * 0.3; // Adjusted for medium screens (e.g., 30% of width)
    } else {
      imageSize = screenWidth * 0.25; // For large screens
    }
    // Ensure a minimum and maximum size to prevent extreme scaling
    imageSize = imageSize.clamp(100.0, 300.0);

    return Container(
      height: imageSize,
      width: imageSize,
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
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double titleScaleFactor = 2.0;
    double subtitleScaleFactor = 1.5; // Adjusted from 2.0 for the longer title

    if (screenWidth < 600) {
      // Small screens
      titleScaleFactor = 1.8;
      subtitleScaleFactor = 1.3;
    } else if (screenWidth < 1200) {
      // Medium screens
      titleScaleFactor = 1.9;
      subtitleScaleFactor = 1.4;
    }
    // Large screens will use the default 2.0 and 1.5

    final profileData = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Hi there! I'm Yogesh",
          textScaler: TextScaler.linear(titleScaleFactor), // Use textScaler
          style: TextStyle(color: Colors.orange), // Removed fontFamily
        ),
        Text(
          'Machine learning Engineer: Discovering new ways to tackle the problems via ML | Author and Editor at raywenderlich.com',
          textScaler: TextScaler.linear(subtitleScaleFactor), // Use textScaler
          style: TextStyle(
              // Removed fontFamily
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "SUMMARY\nExperienced Backend and AI Engineer with 6 years of experience in developing and deploying AI-powered products, ranging from innovative code\ngeneration tools (used by 25,000 developers at Welltested AI) to real-time glucose monitoring systems.\nProven ability to architect complex systems, including microservices architectures and RAG pipelines. Seeking a role in a high-velocity startup tackling\nchallenging engineering problems.",
          softWrap: true,
          textScaler: TextScaler.linear(1.2),
          style: TextStyle(color: Colors.white70),
        ),
        SizedBox(
          height: 8, // Adjusted spacing
        ),
        Text(
          "SKILLS",
          textScaler: TextScaler.linear(1.3), // Slightly larger for title
          style: TextStyle(
            color: Colors.white, // White for better visibility
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 8, // Spacing before chips
        ),
        Wrap(
          spacing: 8.0, // Horizontal spacing between chips
          runSpacing: 4.0, // Vertical spacing between lines of chips
          children: [
            "Solutions Architect",
            "Backend Development",
            "Machine Learning",
            "Deep Learning",
            "Transformers",
            "LSTM",
            "CNN",
            "RNN",
            "GAN",
            "RAG",
            "Reinforcement Learning",
            "Database",
            "Vector DB",
            "Tensorflow",
            "Pytorch",
            "LangChain",
            "Prompt Engineering",
            "Flutter",
            "Dart",
            "Python",
            "Golang",
            "C++",
            "LLM",
            "LLaMA",
            "MLOps",
            "Docker",
            "Leadership",
            "Problem Solving",
            "Research"
          ]
              .map((skill) => Chip(
                    label: Text(skill),
                    backgroundColor: Colors.grey[800], // Darker chip background
                    labelStyle: TextStyle(
                        color: Colors.white70), // Lighter text for chip
                  ))
              .toList(),
        ),
        SizedBox(
          height: 20,
        ),
        Wrap(
          // Use Wrap for buttons
          alignment: WrapAlignment.start, // Align to start
          spacing: 16.0, // Horizontal spacing between buttons
          runSpacing: 8.0, // Vertical spacing if they wrap
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
                _launchUrl(
                    'https://drive.google.com/file/d/1_ikLaMKd0MkffxyDXh7kWwZKSSBxB3i4/view?usp=sharing');
              },
            ),
            // SizedBox removed, Wrap handles spacing
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
                _launchUrl('mailto:youzendachoudhary22@gmail.com');
              },
            )
          ],
        )
      ],
    );
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
        mainAxisSize: MainAxisSize.min, // Changed to min to fit content
        mainAxisAlignment: MainAxisAlignment.center, // Center content
        children: <Widget>[
          profileImage(context),
          SizedBox(
            height:
                MediaQuery.of(context).size.height * 0.05, // Reduced spacing
          ),
          Padding(
            // Add padding around profileData on small screens
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: profileData,
          )
        ],
      ),
    );
  }
}
