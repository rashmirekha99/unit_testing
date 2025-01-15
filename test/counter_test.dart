import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing/counter.dart';

void main() {
  //given when then
  test('given counter class when it is instantiate then counter value should 0',
      () {
    Counter counter = Counter();
    final val = counter.counter;
    expect(val, 0);
  });
}
