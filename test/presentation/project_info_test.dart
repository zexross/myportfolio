import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myportfolio/configs/constant_icons.dart';
import 'package:myportfolio/model/project_info.dart';
import 'package:myportfolio/model/showcase_project.dart';
import 'package:myportfolio/presentation/project_info.dart'; // Assuming this is the correct path

// Global list to be accessed by ProjectInfo widget
List<ShowcaseProject> ksShowcaseProjects = [];

// Mock project data
final _mockProjectFull = ShowcaseProject(
  title: 'Full Project',
  heroTag: 'full-tag',
  image:
      'assets/images/projects/project_1.png', // Placeholder, ensure asset exists or is mocked
  shortDescription: 'This is a full project description.',
  description: 'A longer description detailing the full project.',
  link: ProjectInfo(
    icon: kiLink,
    label: 'Project Links',
    contents: ['http://full.example.com', 'http://another.full.link'],
    isLink: true,
  ),
  tags: ProjectInfo(
    icon: kiChip,
    label: 'General Tags',
    contents: ['GeneralTag1', 'GeneralTag2'],
    isTag: true,
  ),
  tech: ProjectInfo(
    icon: kiChip,
    label: 'Tech Stack',
    contents: ['Flutter', 'Dart', 'Firebase'],
    isTag: true,
  ),
  author: ProjectInfo(
    icon: kiPerson,
    label: 'Authors',
    contents: ['John Doe', 'Jane Smith'],
    isLink: false,
    isTag: false,
  ),
  platform: ProjectInfo(
    icon: kiCode,
    label: 'Platforms',
    contents: ['Web', 'iOS', 'Android'],
    isLink: false,
    isTag: false,
  ),
);

final _mockProjectPartialAndEmpty = ShowcaseProject(
  title: 'Partial Project',
  heroTag: 'partial-tag',
  image: 'assets/images/projects/project_2.png', // Placeholder
  shortDescription: 'Partial and empty sections project.',
  description: 'Description for partial project.',
  link: ProjectInfo(
      icon: kiLink, label: 'Project Links', contents: []), // Empty links
  tags: ProjectInfo(
    icon: kiChip,
    label: 'General Tags',
    contents: [],
    isTag: true,
  ),
  tech: ProjectInfo(
    icon: kiChip,
    label: 'Tech Stack',
    contents: ['Python'], // Has tech
    isTag: true,
  ),
  author: ProjectInfo(
      icon: kiPerson, label: 'Authors', contents: []), // Empty authors
  platform: ProjectInfo(
      icon: kiCode, label: 'Platforms', contents: []), // Empty platforms
);

void main() {
  // Helper to build the widget tree
  Widget makeTestableWidget(String projectTag) {
    return MaterialApp(
      home: MediaQuery(
        // Added MediaQuery
        data: MediaQueryData(), // Provide default media query data
        child: ProjectInfoPage(projectTag: projectTag),
      ),
    );
  }

  setUp(() {
    // Populate the global list before each test
    ksShowcaseProjects = [_mockProjectFull, _mockProjectPartialAndEmpty];
    // Precache images to avoid network errors in tests if assets are network-based (not typical for local assets)
    // However, for local assets, ensure they are declared in pubspec.yaml and accessible.
    // For this test, we assume local assets are correctly set up.
  });

  group('ProjectInfo Widget Tests', () {
    testWidgets('displays project title and shortDescription',
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(_mockProjectFull.heroTag));
      await tester.pumpAndSettle(); // Allow time for initState and UI to build

      expect(find.text(_mockProjectFull.title), findsOneWidget,
          reason: "Project title should be in AppBar");
      expect(find.text(_mockProjectFull.shortDescription), findsOneWidget,
          reason: "Short description should be visible");
    });

    testWidgets('displays Tech Stack section with label, icon, and chips',
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(_mockProjectFull.heroTag));
      await tester.pumpAndSettle();

      expect(find.text('Tech Stack'), findsOneWidget,
          reason: "Tech Stack label should be visible");
      expect(find.byIcon(kiChip), findsWidgets,
          reason:
              "Tech Stack icon (kiChip) should be visible"); // findsWidgets because icon might be used elsewhere

      for (final techItem in _mockProjectFull.tech.contents) {
        expect(find.widgetWithText(Chip, techItem), findsOneWidget,
            reason: "Tech item '$techItem' should be a Chip");
      }
    });

    testWidgets(
        'displays Project Links section with label, icon, and tappable links',
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(_mockProjectFull.heroTag));
      await tester.pumpAndSettle();

      expect(find.text('Project Links'), findsOneWidget,
          reason: "Project Links label should be visible");
      expect(find.byIcon(kiLink), findsWidgets,
          reason: "Project Links icon (kiLink) should be visible");

      for (final linkItem in _mockProjectFull.link.contents) {
        final linkTextFinder = find.text(linkItem);
        expect(linkTextFinder, findsOneWidget,
            reason: "Link '$linkItem' should be visible");
        expect(
            find.ancestor(of: linkTextFinder, matching: find.byType(InkWell)),
            findsOneWidget,
            reason: "Link '$linkItem' should be tappable (InkWell)");
      }
    });

    testWidgets('displays Authors section (plain text) with label and icon',
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(_mockProjectFull.heroTag));
      await tester.pumpAndSettle();

      expect(find.text('Authors'), findsOneWidget,
          reason: "Authors label should be visible");
      expect(find.byIcon(kiPerson), findsWidgets,
          reason: "Authors icon (kiPerson) should be visible");

      for (final authorItem in _mockProjectFull.author.contents) {
        expect(find.text(authorItem), findsOneWidget,
            reason: "Author '$authorItem' should be visible as plain text");
      }
    });

    testWidgets('displays Platforms section (plain text) with label and icon',
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(_mockProjectFull.heroTag));
      await tester.pumpAndSettle();

      expect(find.text('Platforms'), findsOneWidget,
          reason: "Platforms label should be visible");
      expect(find.byIcon(kiCode), findsWidgets,
          reason: "Platforms icon (kiCode) should be visible");

      for (final platformItem in _mockProjectFull.platform.contents) {
        expect(find.text(platformItem), findsOneWidget,
            reason: "Platform '$platformItem' should be visible as plain text");
      }
    });

    testWidgets('displays General Tags (from ShowcaseProject.tags) as Chips',
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(_mockProjectFull.heroTag));
      await tester.pumpAndSettle();

      // Assuming the label for ShowcaseProject.tags is "General Tags" as implemented in ProjectInfo.dart
      expect(find.text('General Tags'), findsOneWidget,
          reason: "General Tags label should be visible");
      // No specific icon defined for ShowcaseProject.tags section in the implementation, so not checking for one.

      for (final tagItem in _mockProjectFull.tags.contents) {
        expect(find.widgetWithText(Chip, tagItem), findsOneWidget,
            reason: "General tag '$tagItem' should be a Chip");
      }
    });

    testWidgets(
        'does NOT display labels or icons for sections with empty content',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(makeTestableWidget(_mockProjectPartialAndEmpty.heroTag));
      await tester.pumpAndSettle();

      // Project Links section is empty
      expect(find.text('Project Links'), findsNothing,
          reason: "Label for empty Project Links should not be visible");
      expect(find.byIcon(kiLink), findsNothing,
          reason: "Icon for empty Project Links should not be visible");

      // Authors section is empty
      expect(find.text('Authors'), findsNothing,
          reason: "Label for empty Authors should not be visible");
      expect(find.byIcon(kiPerson), findsNothing,
          reason: "Icon for empty Authors should not be visible");

      // Platforms section is empty
      expect(find.text('Platforms'), findsNothing,
          reason: "Label for empty Platforms should not be visible");
      expect(find.byIcon(kiCode), findsNothing,
          reason: "Icon for empty Platforms should not be visible");

      // General Tags (ShowcaseProject.tags) is empty
      expect(find.text('General Tags'), findsNothing,
          reason: "Label for empty General Tags should not be visible");
    });

    testWidgets(
        'displays sections that DO have content for a partially empty project',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(makeTestableWidget(_mockProjectPartialAndEmpty.heroTag));
      await tester.pumpAndSettle();

      // Short description should still be visible
      expect(find.text(_mockProjectPartialAndEmpty.shortDescription),
          findsOneWidget);

      // Tech Stack section is NOT empty
      expect(find.text('Tech Stack'), findsOneWidget,
          reason: "Tech Stack label should be visible for non-empty section");
      expect(find.byIcon(kiChip), findsWidgets,
          reason: "Tech Stack icon should be visible for non-empty section");
      expect(find.widgetWithText(Chip, 'Python'), findsOneWidget,
          reason: "Tech item 'Python' should be a Chip");
    });

    testWidgets('all sections render correctly together for a full project',
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(_mockProjectFull.heroTag));
      await tester.pumpAndSettle();

      // Check title and short description
      expect(find.text(_mockProjectFull.title), findsOneWidget);
      expect(find.text(_mockProjectFull.shortDescription), findsOneWidget);

      // Check Tech Stack
      expect(find.text('Tech Stack'), findsOneWidget);
      expect(find.byIcon(kiChip), findsWidgets);
      expect(find.widgetWithText(Chip, 'Flutter'), findsOneWidget);

      // Check Project Links
      expect(find.text('Project Links'), findsOneWidget);
      expect(find.byIcon(kiLink), findsWidgets);
      expect(find.text('http://full.example.com'), findsOneWidget);

      // Check Authors
      expect(find.text('Authors'), findsOneWidget);
      expect(find.byIcon(kiPerson), findsWidgets);
      expect(find.text('John Doe'), findsOneWidget);

      // Check Platforms
      expect(find.text('Platforms'), findsOneWidget);
      expect(find.byIcon(kiCode), findsWidgets);
      expect(find.text('Web'), findsOneWidget);

      // Check General Tags
      expect(find.text('General Tags'), findsOneWidget);
      expect(find.widgetWithText(Chip, 'GeneralTag1'), findsOneWidget);
    });
  });
}
