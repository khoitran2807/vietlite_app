import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/plugin/firebase/remote_config_service.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/common_mocks.dart';

void main() {
  late MockRemoteConfig mockConfig;
  late RemoteConfigService service;

  setUp(() {
    mockConfig = MockRemoteConfig();
    service = RemoteConfigService(remoteConfig: mockConfig);
  });

  group('RemoteConfigService.init', () {
    test('calls debugPrint when setDefaults throws', () async {
      // Mock setDefaults to throw
      when(() => mockConfig.setDefaults(any())).thenThrow(Exception('fail'));
      when(() => mockConfig.fetchAndActivate()).thenAnswer((_) async => true);

      // Override debugPrint to capture calls
      final prints = <String>[];
      debugPrint = (String? message, {int? wrapWidth}) {
        if (message != null) prints.add(message);
      };

      await service.init();

      expect(prints.length, 1);
      expect(prints.first, contains('Exception: fail'));

      // Reset debugPrint to default to avoid affecting other tests
      debugPrint = debugPrintThrottled;
    });
    test('calls debugPrint when fetchAndActivate throws', () async {
      when(() => mockConfig.setDefaults(any())).thenAnswer((_) async {});
      when(
        () => mockConfig.fetchAndActivate(),
      ).thenThrow(Exception('fetch fail'));

      final prints = <String>[];
      debugPrint = (String? message, {int? wrapWidth}) {
        if (message != null) prints.add(message);
      };

      await service.init();

      expect(prints.length, 1);
      expect(prints.first, contains('Exception: fetch fail'));

      debugPrint = debugPrintThrottled;
    });
    test('calls setDefaults and fetchAndActivate successfully', () async {
      when(() => mockConfig.setDefaults(any())).thenAnswer((_) async => {});
      when(() => mockConfig.fetchAndActivate()).thenAnswer((_) async => true);

      await service.init();

      verify(
        () => mockConfig.setDefaults({
          RemoteConfigConstants.numbers: 10,
          RemoteConfigConstants.letters: 63,
          RemoteConfigConstants.wordSelections: 10,
          RemoteConfigConstants.wordMatches: 10,
          RemoteConfigConstants.things: 60,
        }),
      ).called(1);
      verify(() => mockConfig.fetchAndActivate()).called(1);
    });

    test('catches exception in init without throwing', () async {
      when(() => mockConfig.setDefaults(any())).thenThrow(Exception('fail'));
      when(() => mockConfig.fetchAndActivate()).thenAnswer((_) async => true);

      await service.init(); // Should not throw
      verify(() => mockConfig.setDefaults(any())).called(1);
      // fetchAndActivate may or may not be called depending on try/catch
    });
  });

  group('RemoteConfigService getters', () {
    test('returns correct numbers', () {
      when(
        () => mockConfig.getInt(RemoteConfigConstants.numbers),
      ).thenReturn(5);
      expect(service.numbers, 5);
    });

    test('returns correct letters', () {
      when(
        () => mockConfig.getInt(RemoteConfigConstants.letters),
      ).thenReturn(10);
      expect(service.letters, 10);
    });

    test('returns correct wordSelections', () {
      when(
        () => mockConfig.getInt(RemoteConfigConstants.wordSelections),
      ).thenReturn(7);
      expect(service.wordSelections, 7);
    });

    test('returns correct wordMatches', () {
      when(
        () => mockConfig.getInt(RemoteConfigConstants.wordMatches),
      ).thenReturn(8);
      expect(service.wordMatches, 8);
    });

    test('returns correct wordNSentences', () {
      when(
        () => mockConfig.getInt(RemoteConfigConstants.wordSelections),
      ).thenReturn(7);
      when(
        () => mockConfig.getInt(RemoteConfigConstants.wordMatches),
      ).thenReturn(8);
      expect(service.wordNSentences, 15);
    });

    test('returns correct things', () {
      when(
        () => mockConfig.getInt(RemoteConfigConstants.things),
      ).thenReturn(20);
      expect(service.things, 20);
    });
  });
}
