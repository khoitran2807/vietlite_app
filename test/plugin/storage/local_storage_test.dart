import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/plugin/storage/local_storage.dart';

void main() {
  const MethodChannel channel = MethodChannel(
    'plugins.it_nomads.com/flutter_secure_storage',
  );
  TestWidgetsFlutterBinding.ensureInitialized();

  group('LocalStorage', () {
    late LocalStorage localStorage;

    setUp(() {
      localStorage = LocalStorage();

      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
            // Default mock handler that simulates successful calls
            switch (methodCall.method) {
              case 'read':
                return 'mock_value';
              case 'readAll':
                return {'key': 'mock_value'};
              default:
                return null;
            }
          });
    });

    test('writeItem stores an item successfully', () async {
      await localStorage.writeItem('test_key', 'test_value');
      // If no exception is thrown, the test passes
    });

    test('writeItem handles exception', () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
            throw PlatformException(
              code: 'ERROR',
              message: 'Simulated exception',
            );
          });
      await localStorage.writeItem('test_key', 'test_value');
      // The exception is caught internally; test passes if no uncaught exception
    });

    test('readItem retrieves an item successfully', () async {
      final value = await localStorage.readItem('test_key');
      expect(value, 'mock_value');
    });

    test('readItem handles exception', () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
            throw PlatformException(
              code: 'ERROR',
              message: 'Simulated exception',
            );
          });
      final value = await localStorage.readItem('test_key');
      expect(value, isNull);
    });

    test('deleteItem deletes an item successfully', () async {
      await localStorage.deleteItem(key: 'test_key');
      // If no exception is thrown, the test passes
    });

    test('deleteItem handles exception', () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
            throw PlatformException(
              code: 'ERROR',
              message: 'Simulated exception',
            );
          });
      await localStorage.deleteItem(key: 'test_key');
      // The exception is caught internally; test passes if no uncaught exception
    });

    test('clearAllItem clears all items successfully', () async {
      await localStorage.clearAllItem();
      // If no exception is thrown, the test passes
    });

    test('clearAllItem handles exception', () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
            throw PlatformException(
              code: 'ERROR',
              message: 'Simulated exception',
            );
          });
      await localStorage.clearAllItem();
      // The exception is caught internally; test passes if no uncaught exception
    });
  });
}
