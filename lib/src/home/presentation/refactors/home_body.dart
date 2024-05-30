import 'package:education_app/core/common/app/providers/course_of_the_day_notifier.dart';
import 'package:education_app/core/common/views/loading_view.dart';
import 'package:education_app/core/common/widgets/not_found_text.dart';
import 'package:education_app/core/utils/core_utils.dart';
import 'package:education_app/src/course/presentation/cubit/course_cubit.dart';
import 'package:education_app/src/home/presentation/refactors/home_header.dart';
import 'package:education_app/src/home/presentation/refactors/home_subjects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  void getCourses() {
    context.read<CourseCubit>().getCourses();
  }

  @override
  void initState() {
    getCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourseCubit, CourseState>(
      builder: (context, state) {
        if (state is LoadingCourses) {
          return const LoadingView();
        } else if ((state is CourseLoaded && state.courses.isEmpty) ||
            state is CourseError) {
          return const NotFoundText(
            'No Course foud\nPease contact admin if you are admin',
          );
        } else if (state is CourseLoaded) {
          final courses = state.courses
            ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              const HomeHeader(),
              const SizedBox(height: 20),
              HomeSubjects(courses: courses),
            ],
          );
        }
        return const SizedBox.shrink();
      },
      listener: (_, state) {
        if (state is CourseError) {
          CoreUtils.showSnackBar(
            context,
            state.message,
          );
        } else if (state is CourseLoaded && state.courses.isNotEmpty) {
          final courses = state.courses..shuffle();
          final courseOfTheDay = courses.first;
          context
              .read<CourseOfTheDayNotofier>()
              .setCourseOfTheDay(courseOfTheDay);
        }
      },
    );
  }
}
