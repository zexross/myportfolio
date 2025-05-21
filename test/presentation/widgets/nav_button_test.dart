import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myportfolio/presentation/widgets/nav_button.dart';

void main() {
  testWidgets('NavButton displays text and is tappable', (WidgetTester tester) async {
    String buttonText = 'Test Button';
    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NavButton(
            text: buttonText,
            onPressed: () {
              tapped = true;
            },
          ),
        ),
      ),
    );

    // Verify that the NavButton displays the correct text.
    expect(find.text(buttonText), findsOneWidget);

    // Verify that the button is an OutlinedButton.
    expect(find.byType(OutlinedButton), findsOneWidget);

    // Tap the NavButton.
    await tester.tap(find.text(buttonText));
    await tester.pump(); // Rebuild the widget after the tap.

    // Verify that the onPressed callback was triggered.
    expect(tapped, isTrue);
  });

  testWidgets('NavButton uses default orange color', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NavButton(
            text: 'Color Test',
            onPressed: () {},
          ),
        ),
      ),
    );

    final OutlinedButton button = tester.widget(find.byType(OutlinedButton));
    expect(button.style?.side?.resolve({})?.color, Colors.orange);
  });

  testWidgets('NavButton uses provided color', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NavButton(
            text: 'Color Test',
            onPressed: () {},
            color: Colors.blue,
          ),
        ),
      ),
    );

    final OutlinedButton button = tester.widget(find.byType(OutlinedButton));
    expect(button.style?.side?.resolve({})?.color, Colors.blue);
  });
}
