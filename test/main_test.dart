import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:discount_alcohol/main.dart';

void main() {
  testWidgets('Check for all alcohol buttons', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyHomePage());

    // Verify that our counter starts at 0.
    /*expect(find.text('Beer'), findsOneWidget);
    expect(find.text('Wine'), findsOneWidget);
    expect(find.text('Vodka'), findsOneWidget);
    expect(find.text('Whiskey'), findsOneWidget);
    expect(find.text('Gin'), findsOneWidget);
    expect(find.text('Rum'), findsOneWidget);
    expect(find.text('Champagne'), findsOneWidget);
    expect(find.text('Tequila'), findsOneWidget);*/

    expect(find.text('Beer'), findsNothing);
    expect(find.text('Wine'), findsNothing);
    expect(find.text('Vodka'), findsNothing);
    expect(find.text('Whiskey'), findsNothing);
    expect(find.text('Gin'), findsNothing);
    expect(find.text('Rum'), findsNothing);
    expect(find.text('Champagne'), findsNothing);
    expect(find.text('Tequila'), findsNothing);
    // Tap the '+' icon and trigger a frame.
    //await tester.tap(find.byIcon(Icons.add));
    //await tester.pump();

  });
}
