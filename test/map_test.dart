import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:discount_alcohol/mapPage.dart';
import 'package:discount_alcohol/main.dart';

void main() {
  testWidgets('Filter test: Beer', (WidgetTester tester) async {
    await tester.pumpWidget(MapPage("Beer"));
    await tester.tap(find.byType(DropdownButtonFormField));
    await tester.pump();
    await tester.tap(find.text("10 mi"));
    await tester.pump();


  });

  testWidgets('Filter test: Wine', (WidgetTester tester) async {
    await tester.pumpWidget(MapPage("Wine"));
    await tester.tap(find.byType(DropdownButtonFormField));
    await tester.pump();
    await tester.tap(find.text("1 mi"));
    await tester.pump();


  });

  testWidgets('Filter test: Vodka', (WidgetTester tester) async {
    await tester.pumpWidget(MapPage("Vodka"));
    await tester.tap(find.byType(DropdownButtonFormField));
    await tester.pump();
    await tester.tap(find.text("3 mi"));
    await tester.pump();


  });
  testWidgets('Filter test: Whiskey', (WidgetTester tester) async {
    await tester.pumpWidget(MapPage("Whiskey"));
    await tester.tap(find.byType(DropdownButtonFormField));
    await tester.pump();
    await tester.tap(find.text("5 mi"));
    await tester.pump();


  });
  testWidgets('Filter test: Gin', (WidgetTester tester) async {
    await tester.pumpWidget(MapPage("Gin"));
    await tester.tap(find.byType(DropdownButtonFormField));
    await tester.pump();
    await tester.tap(find.text("20 mi"));
    await tester.pump();


  });
  testWidgets('Filter test: Champange', (WidgetTester tester) async {
    await tester.pumpWidget(MapPage("Champange"));
    await tester.tap(find.byType(DropdownButtonFormField));
    await tester.pump();
    await tester.tap(find.text("50 mi"));
    await tester.pump();


  });
  testWidgets('Filter test: Rum', (WidgetTester tester) async {
    await tester.pumpWidget(MapPage("Rum"));
    await tester.tap(find.byType(DropdownButtonFormField));
    await tester.pump();
    await tester.tap(find.text("3 mi"));
    await tester.pump();


  });
  testWidgets('Filter test: Tequila', (WidgetTester tester) async {
    await tester.pumpWidget(MapPage("Tequila"));
    await tester.tap(find.byType(DropdownButtonFormField));
    await tester.pump();
    await tester.tap(find.text("10 mi"));
    await tester.pump();


  });
}