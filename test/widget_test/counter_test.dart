import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing/main.dart';

void main() {
  testWidgets('given counter 0  when increment button clicked it should be 1',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MyHomePage(title: 'Counter App'),
      ),
    );
    final counter = find.text('0');
    expect(counter, findsOneWidget);

    final incrementBtn = find.byType(FloatingActionButton);
    await tester.tap(incrementBtn);
    //bcz of setstate
    await tester.pump();
    final counter2 = find.text('1');
    expect(counter2, findsOneWidget);
    //second tap

    await tester.tap(incrementBtn);
    //bcz of setstate
    await tester.pump();

    expect(find.text('2'), findsOneWidget);
  });
}
