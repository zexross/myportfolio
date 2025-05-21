import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myportfolio/presentation/widgets/nav_button.dart';
import 'package:myportfolio/presentation/widgets/nav_header.dart';
import 'package:myportfolio/presentation/widgets/yc_dot.dart';
// Assuming this path is correct for the test environment

// A simple mock for ResponsiveWidget for consistent testing if needed,
// or rely on MaterialApp to provide MediaQuery.
// For this test, we'll wrap with MaterialApp and assume large screen behavior.

void main() {
  // Helper function to wrap widget for testing
  Widget createTestableWidget({required Widget child}) {
    return MaterialApp(
      home: Scaffold(body: child),
    );
  }

  testWidgets('NavHeader renders YCDot', (WidgetTester tester) async {
    await tester.pumpWidget(
      createTestableWidget(
        child: NavHeader(navButtons: []),
      ),
    );

    expect(find.byType(YCDot), findsOneWidget);
  });

  testWidgets('NavHeader displays navigation buttons', (WidgetTester tester) async {
    final List<Widget> testButtons = [
      NavButton(text: 'Button1', onPressed: () {}),
      NavButton(text: 'Button2', onPressed: () {}),
    ];

    // Set a large screen size for ResponsiveWidget to show buttons
    tester.view.physicalSize = Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      createTestableWidget(
        child: NavHeader(navButtons: testButtons),
      ),
    );
    await tester.pumpAndSettle(); // Ensure ResponsiveWidget settles

    expect(find.text('Button1'), findsOneWidget);
    expect(find.text('Button2'), findsOneWidget);
  });

  testWidgets('NavHeader displays page title in YCDot', (WidgetTester tester) async {
    const String pageTitle = 'My Page';
    await tester.pumpWidget(
      createTestableWidget(
        child: NavHeader(navButtons: [], pageTitle: pageTitle),
      ),
    );

    // Find the YCDot widget
    final ycDotFinder = find.byType(YCDot);
    expect(ycDotFinder, findsOneWidget);

    // Check the YCDot instance for the title
    final YCDot ycDotWidget = tester.widget(ycDotFinder);
    expect(ycDotWidget.title, pageTitle);

    // Also check if the text is rendered
    expect(find.text(pageTitle), findsOneWidget);
  });

   testWidgets('NavHeader hides navigation buttons on small screen by default', (WidgetTester tester) async {
    final List<Widget> testButtons = [
      NavButton(text: 'Button1', onPressed: () {}),
      NavButton(text: 'Button2', onPressed: () {}),
    ];

    // Set a small screen size
    tester.view.physicalSize = Size(400, 600);
    tester.view.devicePixelRatio = 1.0;
    
    // Re-initialize ResponsiveWidget with the new screen size context
    // This typically happens by rebuilding the tree that contains ResponsiveWidget
    // For this test, we'll pump the widget again which should make ResponsiveWidget re-evaluate.

    await tester.pumpWidget(
      createTestableWidget(
        child: NavHeader(navButtons: testButtons),
      ),
    );
    await tester.pumpAndSettle(); // Ensure ResponsiveWidget settles

    // On small screens, NavHeader's ResponsiveWidget setup hides the Row of navButtons
    expect(find.text('Button1'), findsNothing);
    expect(find.text('Button2'), findsNothing);
  });
}
