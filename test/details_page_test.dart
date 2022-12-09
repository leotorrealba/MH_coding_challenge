import 'package:coding_challenge/pages/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Appbar back finder', (WidgetTester tester) async {
    final topBack = find.byKey(const Key("topBack"));

    await tester.pumpWidget(MaterialApp(home: DetailsPage()));
    await tester.tap(topBack);
    await tester.pump();

    expect(find.byKey(const Key('topBack')), findsOneWidget);
  });
}
