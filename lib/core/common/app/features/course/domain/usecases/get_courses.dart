import 'package:education_app/core/common/app/features/course/domain/entities/course.dart';
import 'package:education_app/core/common/app/features/course/domain/repos/course_repo.dart';
import 'package:education_app/core/usecases/usecases.dart';
import 'package:education_app/core/utils/typedef.dart';

class GetCourse extends UsecasesWithoutParams<List<Course>> {
  const GetCourse(this._repo);

  final CourseRepo _repo;

  @override
  ResultFuture<List<Course>> call() async => _repo.getCourse();
}
