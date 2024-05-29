import 'package:dartz/dartz.dart';
import 'package:education_app/src/course/domain/entities/course.dart';
import 'package:education_app/src/course/domain/repos/course_repo.dart';
import 'package:education_app/src/course/domain/usecases/get_courses.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'course_repo.mock.dart';

void main() {
  late CourseRepo repo;
  late GetCourse usecase;

  setUp(() {
    repo = MockCourseRepo();
    usecase = GetCourse(repo);
  });

  test('should get courses from the repo', () async {
    // arrange
    when(() => repo.getCourse()).thenAnswer((_) async => const Right([]));
    // act
    final result = await usecase();
    // assert
    expect(result, const Right<dynamic, List<Course>>([]));
    verify(() => repo.getCourse()).called(1);
    verifyNoMoreInteractions(repo);
  });
}
