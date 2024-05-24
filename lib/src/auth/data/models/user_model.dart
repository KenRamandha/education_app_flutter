import 'package:education_app/core/utils/typedef.dart';
import 'package:education_app/src/auth/domain/entities/user.dart';

class LocalUserModel extends LocalUser {
  const LocalUserModel({
    required super.userId,
    required super.email,
    required super.points,
    required super.fullName,
    super.groupIds,
    super.enrollCoursesIds,
    super.following,
    super.followers,
    super.photoProfile,
    super.bio,
  });

  const LocalUserModel.empty()
      : this(
          userId: '',
          email: '',
          points: 0,
          fullName: '',
        );

  LocalUserModel.fromMap(DataMap map)
      : super(
          userId: map['userId'] as String,
          email: map['email'] as String,
          points: (map['points'] as num).toInt(),
          fullName: map['fullName'] as String,
          photoProfile: map['profilePictures'] as String?,
          bio: map['bio'] as String?,
          groupIds: (map['groupIds'] as List<dynamic>).cast<String>(),
          enrollCoursesIds:
              (map['enrollCoursesIds'] as List<dynamic>).cast<String>(),
          following: (map['following'] as List<dynamic>).cast<String>(),
          followers: (map['followers'] as List<dynamic>).cast<String>(),
        );

  LocalUser copyWith({
    String? userId,
    String? email,
    String? photoProfile,
    String? bio,
    int? points,
    String? fullName,
    List<String>? groupIds,
    List<String>? enrollCoursesIds,
    List<String>? following,
    List<String>? followers,
  }) {
    return LocalUser(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      photoProfile: photoProfile ?? this.photoProfile,
      bio: bio ?? this.bio,
      points: points ?? this.points,
      fullName: fullName ?? this.fullName,
      groupIds: groupIds ?? this.groupIds,
      enrollCoursesIds: enrollCoursesIds ?? this.enrollCoursesIds,
      following: following ?? this.following,
      followers: followers ?? this.followers,
    );
  }

  DataMap toMap() {
    return {
      'userId': userId,
      'email': email,
      'photoProfile': photoProfile,
      'bio': bio,
      'points': points,
      'fullName': fullName,
      'groupIds': groupIds,
      'enrolledCourseIds': enrollCoursesIds,
      'following': following,
      'followers': followers,
    };
  }
}
