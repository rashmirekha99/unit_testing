import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unit_testing/models/todo_model.dart';
import 'package:unit_testing/services/todo_servvices.dart';

class MockHTTPClient extends Mock implements Client {}

void main() {
  group('Todo api - ', () {
    late TodoServices todoServices;
    late MockHTTPClient mockHTTPClient;
    setUp(() {
      mockHTTPClient = MockHTTPClient();
      todoServices = TodoServices(mockHTTPClient);
    });
    test('given todo get API when status code 200 TodoModel should returned',
        () async {
      when(() => mockHTTPClient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/')))
          .thenAnswer((invocation) async {
        return Response('''
      [
  {
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
  }]
''', 200);
      });
      final res = await todoServices.getTodo();
      expect(res, isA<List<TodoModel>>());
    });

    test(
        'given todo api when status code is not 200 then exception should be throwed',
        () async {
      when(() => mockHTTPClient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/')))
          .thenAnswer((invocation) async {
        return Response('{}', 500);
      });
//if add await here-> it actually run the code and throw exception
      final res =  todoServices.getTodo();
      expect(res, throwsException);
    });
  });
}
