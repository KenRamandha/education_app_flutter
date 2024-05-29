import 'package:dartz/dartz.dart';
import 'package:education_app/core/common/app/features/course/data/datasources/course_remote_data_src.dart';
import 'package:education_app/core/common/app/features/course/domain/entities/course.dart';
import 'package:education_app/core/common/app/features/course/domain/repos/course_repo.dart';
import 'package:education_app/core/errors/exceptions.dart';
import 'package:education_app/core/errors/failures.dart';
import 'package:education_app/core/utils/typedef.dart';

class CourseRepoImpl implements CourseRepo {
  const CourseRepoImpl(this._remoteDataSrc);

  final CourseRemoteDataSrc _remoteDataSrc;

  @override
  ResultFuture<void> addCourse(Course course) async {
    try {
      await _remoteDataSrc.addCourse(course);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Course>> getCourse() async {
    try {
      final courses = await _remoteDataSrc.getCourse();
      return Right(courses);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
