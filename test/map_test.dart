import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:discount_alcohol/mapPage.dart';

void main() {
  testWidgets('Filter test: Beer', (WidgetTester tester) async {
    await tester.pumpWidget(MapPage("Beer"));
    await tester.tap(find.byType(DropdownButtonFormField));
    await tester.pump();
    await tester.tap(find.text("10 mi"));
    await tester.pump();


  });
}