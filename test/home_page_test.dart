import 'package:coding_challenge/app.dart';
import 'package:coding_challenge/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ListTile finder', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    Finder stfw = find.byKey(const Key("ListTile"));
    expect(stfw, findsWidgets);
  });
}
