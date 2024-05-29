import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:education_app/core/errors/failures.dart';
import 'package:education_app/src/course/data/models/course_model.dart';
import 'package:education_app/src/course/domain/usecases/add_courses.dart';
import 'package:education_app/src/course/domain/usecases/get_courses.dart';
import 'package:education_app/src/course/presentation/cubit/course_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAddCourse extends Mock implements AddCourse {}

class MockGetCourse extends Mock implements GetCourse {}

void main() {
  late AddCourse addCourse;
  late GetCourse getCourse;
  late CourseCubit courseCubit;

  final tCourse = CourseModel.empty();

  setUp(() {
    addCourse = MockAddCourse();
    getCourse = MockGetCourse();
    courseCubit = CourseCubit(
      addCourse: addCourse,
      getCourse: getCourse,
    );
    registerFallbackValue(tCourse);
  });

  tearDown(() => courseCubit.close());

  test(
    'initial state should be [CourseInitial]',
    () async => expect(
      courseCubit.state,
      const CourseInitial(),
    ),
  );

  group('addCourse', () {
    blocTest<CourseCubit, CourseState>(
      'emits [AddingCourse, CourseAdded] when addCourse is called',
      build: () {
        when(() => addCourse(any())).thenAnswer((_) async => const Right(null));
        return courseCubit;
      },
      act: (cubit) => cubit.addCourse(tCourse),
      expect: () => const <CourseState>[
        AddingCourse(),
        CourseAdded(),
      ],
      verify: (_) {
        verify(() => addCourse(tCourse)).called(1);
        verifyNoMoreInteractions(addCourse);
      },
    );

    blocTest<CourseCubit, CourseState>(
      'emits [AddingCourse, CourseError] when addCourse is called',
      build: () {
        when(() => addCourse(any())).thenAnswer(
          (_) async => Left(
            ServerFailure(
              message: 'Something went wrong',
              statusCode: '500',
            ),
          ),
        );
        return courseCubit;
      },
      act: (cubit) => cubit.addCourse(tCourse),
      expect: () => const <CourseState>[
        AddingCourse(),
        CourseError('500 Error: Something went wrong'),
      ],
      verify: (_) {
        verify(() => addCourse(tCourse)).called(1);
        verifyNoMoreInteractions(addCourse);
      },
    );
  });

  group('getCourse', () {
    blocTest<CourseCubit, CourseState>(
      'emits [CourseLoading, CourseLoaded] when getCourse is called',
      build: () {
        when(() => getCourse()).thenAnswer((_) async => Right([tCourse]));
        return courseCubit;
      },
      act: (cubit) => cubit.getCourses(),
      expect: () => <CourseState>[
        const LoadingCourses(),
        CourseLoaded([tCourse]),
      ],
      verify: (_) {
        verify(() => getCourse()).called(1);
        verifyNoMoreInteractions(getCourse);
      },
    );

    blocTest<CourseCubit, CourseState>(
      'emits [CourseLoading, CourseError] when addCourse is caller',
      build: () {
        when(() => getCourse()).thenAnswer(
          (_) async => Left(
            ServerFailure(
              message: 'Something went wrong',
              statusCode: '500',
            ),
          ),
        );
        return courseCubit;
      },
      act: (cubit) => cubit.getCourses(),
      expect: () => const <CourseState>[
        LoadingCourses(),
        CourseError('500 Error: Something went wrong'),
      ],
      verify: (_) {
        verify(() => getCourse()).called(1);
        verifyNoMoreInteractions(getCourse);
      },
    );
  });
}
