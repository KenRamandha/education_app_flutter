import 'package:education_app/core/errors/exceptions.dart';
import 'package:education_app/src/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferencess extends Mock implements SharedPreferences {}

void main() {
  late SharedPreferences prefs;
  late OnBoardingLocalDataSource localDataSource;

  setUp(() {
    prefs = MockSharedPreferencess();
    localDataSource = OnBoardingLocalDataSrcImpl(prefs);
  });

  group('cacheFirstTimer', () {
    test('should call [SharedPrefrencess] to cachee the data', () async {
      when(
        () => prefs.setBool(
          any(),
          any(),
        ),
      ).thenAnswer(
        (_) async => true,
      );

      await localDataSource.cacheFirstTimer();

      verify(
        () => prefs.setBool(kFirstTimerKey, false),
      );
      verifyNoMoreInteractions(prefs);
    });

    test(
      'should throw [SharedPrefrencess] when there is an error caching the data',
      () async {
        when(
          () => prefs.setBool(
            any(),
            any(),
          ),
        ).thenThrow(
          Exception(),
        );

        final methodeCall = localDataSource.cacheFirstTimer();

        expect(methodeCall, throwsA(isA<CacheException>()));

        verify(
          () => prefs.setBool(kFirstTimerKey, false),
        ).called(1);
        verifyNoMoreInteractions(prefs);
      },
    );
  });

  group('checkIfUserIsFirstTimer', () {
    test(
      'should call [SharedPrefrencess] to check if user is first timer and return the right response from storage when data exist',
      () async {
        when(
          () => prefs.getBool(any()),
        ).thenReturn(false);

        final result = await localDataSource.checkIfUserIsFirstTimer();

        expect(result, false);

        verify(
          () => prefs.getBool(kFirstTimerKey),
        );
        verifyNoMoreInteractions(prefs);
      },
    );

    test('should return true if there is no data in storage', () async {
      when(() => prefs.getBool(any())).thenReturn(null);

      final result = await localDataSource.checkIfUserIsFirstTimer();

      expect(result, true);

      verify(
        () => prefs.getBool(kFirstTimerKey),
      ).called(1);
      verifyNoMoreInteractions(prefs);
    });

    test(
        'should thorws a [CacheException] when there is an error retriving the data',
        () async {
      when(() => prefs.getBool(any())).thenThrow(Exception());

      final call = localDataSource.checkIfUserIsFirstTimer();

      expect(call, throwsA(isA<CacheException>()));
      verify(
        () => prefs.getBool(kFirstTimerKey),
      ).called(1);
      verifyNoMoreInteractions(prefs);
    });
  });
}
