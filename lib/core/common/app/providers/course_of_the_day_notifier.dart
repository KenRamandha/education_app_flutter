import 'package:education_app/src/course/domain/entities/course.dart';
import 'package:flutter/foundation.dart';

class CourseOfTheDayNotofier extends ChangeNotifier {
  Course? _courseOftheDay;

  Course? get courseOfTheday => _courseOftheDay;

  void setCourseOfTheDay(Course course) {
    _courseOftheDay ??= course;
    notifyListeners();
  }
}
