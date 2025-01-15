import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing/counter.dart';

void main() {
  group('counter class - ', () {
    late Counter counter;
    setUp(() {
      counter = Counter();
    });
    //given when then
    test(
        'given counter class when it is instantiate then counter value should 0',
        () {
      final val = counter.counter;
      expect(val, 0);
    });

    test(
        'given counter class when counter increment called counter value should increment by 1',
        () {
      counter.incrementCounter();
      final val = counter.counter;
      expect(val, 1);
    });

    test(
        'given counter class when it is decremented then counter value should be -1',
        () {
      counter.decrementCounter();
      final val = counter.counter;
      expect(val, -1);
    });
    test(
        'given counter class when counter is resetted counter value should be 0',
        () {
      counter.resetCounter();
      final val = counter.counter;
      expect(val, 0);
    });
  });
}
