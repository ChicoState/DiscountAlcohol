import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:discount_alcohol/main.dart';

void main() {
  testWidgets('Check for all alcohol buttons', (WidgetTester tester) async {

    await tester.pumpWidget(MyHomePage());


    expect(find.text('Beer'), findsOneWidget);
    expect(find.text('Wine'), findsOneWidget);
    expect(find.text('Vodka'), findsOneWidget);
    expect(find.text('Whiskey'), findsOneWidget);
    expect(find.text('Gin'), findsOneWidget);
    expect(find.text('Rum'), findsOneWidget);
    expect(find.text('Champagne'), findsOneWidget);
    expect(find.text('Tequila'), findsOneWidget);

    /*expect(find.text('Beer'), findsNothing);
    expect(find.text('Wine'), findsNothing);
    expect(find.text('Vodka'), findsNothing);
    expect(find.text('Whiskey'), findsNothing);
    expect(find.text('Gin'), findsNothing);
    expect(find.text('Rum'), findsNothing);
    expect(find.text('Champagne'), findsNothing);
    expect(find.text('Tequila'), findsNothing);*/


  });
  testWidgets('Check to find no widgets', (WidgetTester tester) async {
    await tester.pumpWidget(MyHomePage());

    expect(find.text('beer'), findsNothing);
    expect(find.text('asdffgsaedrfg'), findsNothing);
    expect(find.text('Be3r'), findsNothing);
    expect(find.text(''), findsNothing);

  });
}
