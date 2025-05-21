import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myportfolio/presentation/widgets/yc_dot.dart';

void main() {
  testWidgets('YCDot displays ZEXROSS and orange dot', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: YCDot(),
        ),
      ),
    );

    // Verify "ZEXROSS" text
    expect(find.text('ZEXROSS'), findsOneWidget);

    // Verify the orange dot (AnimatedContainer)
    final animatedContainerFinder = find.byType(AnimatedContainer);
    expect(animatedContainerFinder, findsOneWidget);

    final AnimatedContainer animatedContainer = tester.widget(animatedContainerFinder);
    final BoxDecoration? decoration = animatedContainer.decoration as BoxDecoration?;
    expect(decoration?.shape, BoxShape.circle);
    expect(decoration?.color, Colors.orange);
    expect(animatedContainer.height, 8);
    expect(animatedContainer.width, 8);
  });

  testWidgets('YCDot displays optional title when provided', (WidgetTester tester) async {
    const String testTitle = 'Test Title';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: YCDot(title: testTitle),
        ),
      ),
    );

    // Verify "ZEXROSS" text
    expect(find.text('ZEXROSS'), findsOneWidget);

    // Verify the optional title
    expect(find.text(testTitle), findsOneWidget);

    // Verify the orange dot is still there
    final animatedContainerFinder = find.byType(AnimatedContainer);
    expect(animatedContainerFinder, findsOneWidget);
  });

  testWidgets('YCDot does not display title when not provided', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: YCDot(), // No title provided
        ),
      ),
    );

    // Verify "ZEXROSS" text
    expect(find.text('ZEXROSS'), findsOneWidget);

    // Check that only one Text widget with textScaleFactor 2 is present (ZEXROSS)
    // This indirectly checks that the title is not rendered.
    int textWidgetCount = 0;
    tester.widgetList(find.byType(Text)).forEach((widget) {
      if (widget is Text && widget.textScaler == TextScaler.linear(2.0)) {
        textWidgetCount++;
      }
    });
    expect(textWidgetCount, 1); 
  });
}
