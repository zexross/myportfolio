import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myportfolio/presentation/widgets/nav_button.dart';
import 'package:myportfolio/presentation/widgets/social_info.dart';
import 'package:myportfolio/responsive_widget.dart'; // Assuming this path

// Helper function to wrap widget for testing
Widget createTestableWidget({required Widget child}) {
  return MaterialApp(
    home: Scaffold(body: child),
  );
}

void main() {
  // Set a consistent screen size for testing ResponsiveWidget behavior
  // Defaulting to a size that ResponsiveWidget would consider "large"
  // to ensure all elements are typically visible.
  Future<void> setupScreenSize(WidgetTester tester, Size size) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1.0;
    // You might need to pump a frame here if ResponsiveWidget reacts to MediaQuery changes
    // immediately upon widget creation, but usually wrapping in MaterialApp handles initial setup.
  }

  testWidgets('SocialInfo renders social media NavButtons', (WidgetTester tester) async {
    await setupScreenSize(tester, Size(1200, 800)); // Large screen
    await tester.pumpWidget(createTestableWidget(child: SocialInfo()));
    await tester.pumpAndSettle();


    expect(find.widgetWithText(NavButton, 'Github'), findsOneWidget);
    expect(find.widgetWithText(NavButton, 'Twitter'), findsOneWidget);
    expect(find.widgetWithText(NavButton, 'Facebook'), findsOneWidget);
  });

  testWidgets('SocialInfo renders copyright text', (WidgetTester tester) async {
    await setupScreenSize(tester, Size(1200, 800)); // Large screen
    await tester.pumpWidget(createTestableWidget(child: SocialInfo()));
    await tester.pumpAndSettle();

    expect(find.text('Yogesh Choudhary ©️2020'), findsOneWidget);
  });

  testWidgets('SocialInfo renders NavButtons correctly on small screen', (WidgetTester tester) async {
    await setupScreenSize(tester, Size(400, 600)); // Small screen
    await tester.pumpWidget(createTestableWidget(child: SocialInfo()));
    await tester.pumpAndSettle();

    // NavButtons should still be present, ResponsiveWidget changes their layout (Column vs Row)
    expect(find.widgetWithText(NavButton, 'Github'), findsOneWidget);
    expect(find.widgetWithText(NavButton, 'Twitter'), findsOneWidget);
    expect(find.widgetWithText(NavButton, 'Facebook'), findsOneWidget);
    expect(find.text('Yogesh Choudhary ©️2020'), findsOneWidget);
  });

  // Mocking url_launcher calls if necessary (SocialInfo calls _launchUrl)
  // For these tests, we are primarily concerned with rendering, not the action of url_launcher.
  // If tests failed due to url_launcher, we'd need to mock it.
  // However, NavButton itself doesn't directly call _launchUrl, SocialInfo's methods do.
  // The NavButton's onPressed is what calls it. Our NavButton tests already check tappability.
  // Here, we are checking if NavButtons with specific text (implying they are for social media) are rendered.
}
