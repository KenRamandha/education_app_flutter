
import 'package:education_app/core/common/app/features/course/domain/entities/course.dart';
import 'package:education_app/core/common/app/features/course/domain/repos/course_repo.dart';
import 'package:education_app/core/usecases/usecases.dart';
import 'package:education_app/core/utils/typedef.dart';

class AddCourse extends UsecasesWithParams<void, Course> {
  const AddCourse(this._repo);

  final CourseRepo _repo;

  @override
  ResultFuture<void> call(Course params) async => _repo.addCourse(params);
}
