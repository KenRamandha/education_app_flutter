// ignore_for_file: lines_longer_than_80_chars

import 'package:education_app/core/common/widgets/course_info_tile.dart';
import 'package:education_app/core/common/widgets/expandable_text.dart';
import 'package:education_app/core/common/widgets/gradient_background.dart';
import 'package:education_app/core/extensions/context_extension.dart';
import 'package:education_app/core/extensions/int_extension.dart';
import 'package:education_app/core/res/media_res.dart';
import 'package:education_app/src/course/domain/entities/course.dart';
import 'package:flutter/material.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen(this.course, {super.key});

  static const routeName = '/course-details';

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: GradientBackgound(
        image: MediaRes.homeGradientBackground,
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              SizedBox(
                height: context.height * .3,
                child: Center(
                  child: course.image != null
                      ? Image.network(course.image!)
                      : Image.asset(MediaRes.casualMeditation),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (course.description != null)
                    ExpandableText(
                      context,
                      text: course.description!,
                    ),
                  if (course.numberOfMaterials > 0 ||
                      course.numberOfVideos > 0 ||
                      course.numberOfExams > 0) ...[
                    const SizedBox(height: 20),
                    const Text(
                      'Course Details',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (course.numberOfVideos > 0) ...[
                      const SizedBox(height: 10),
                      CourseInfoTile(
                        image: MediaRes.courseInfoVideo,
                        title:
                            '${course.numberOfVideos} Video${course.numberOfVideos.counter}',
                        subtittle:
                            'Watch our tutorial videos for ${course.title}',
                        onTap: () => Navigator.of(context).pushNamed(
                          '/unknown-routeName',
                          arguments: course,
                        ),
                      ),
                    ],
                    if (course.numberOfExams > 0) ...[
                      const SizedBox(height: 10),
                      CourseInfoTile(
                        image: MediaRes.courseInfoExam,
                        title:
                            '${course.numberOfExams} Exam${course.numberOfExams.counter}',
                        subtittle: 'Take our exam for ${course.title}',
                        onTap: () => Navigator.of(context).pushNamed(
                          '/unknown-routeName',
                          arguments: course,
                        ),
                      ),
                    ],
                    if (course.numberOfMaterials > 0) ...[
                      const SizedBox(height: 10),
                      CourseInfoTile(
                        image: MediaRes.courseInfoMaterial,
                        title:
                            '${course.numberOfMaterials} Material${course.numberOfMaterials.counter}',
                        subtittle:
                            'Access to ${course.numberOfMaterials.estimate} '
                            'materials for ${course.title}',
                        onTap: () => Navigator.of(context).pushNamed(
                          '/unknown-routeName',
                          arguments: course,
                        ),
                      ),
                    ],
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
