import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing/main.dart';

void main() {
  group('counter test', () {
    testWidgets('given counter 0  when increment button clicked it should be 1',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyHomePage(title: 'Counter App'),
        ),
      );
      final counter = find.text('0');
      expect(counter, findsOneWidget);

      final incrementBtn = find.byKey(const Key('+'));
      await tester.tap(incrementBtn);
      //bcz of setstate
      await tester.pump();
      final counter2 = find.text('1');
      expect(counter2, findsOneWidget);
    });
    testWidgets(
        'given counter 0 when decrement button clicked then counter should be -1',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: MyHomePage(title: 'Counter App'),
      ));
      final dcremenBtn = find.byKey(const Key('_'));
      await tester.tap(dcremenBtn);
      await tester.pump();
      expect(find.text('-1'), findsOneWidget);
    });
  });
}
