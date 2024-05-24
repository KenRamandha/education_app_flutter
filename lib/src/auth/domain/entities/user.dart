import 'package:equatable/equatable.dart';

class LocalUser extends Equatable {
  const LocalUser({
    required this.userId,
    required this.email,
    required this.points,
    required this.fullName,
    this.groupIds = const [],
    this.enrollCoursesIds = const [],
    this.following = const [],
    this.followers = const [],
    this.photoProfile,
    this.bio,
  });

  const LocalUser.empty()
      : this(
          userId: '',
          email: '',
          points: 0,
          fullName: '',
          groupIds: const [],
          enrollCoursesIds: const [],
          following: const [],
          followers: const [],
          photoProfile: '',
          bio: '',
        );

  final String userId;
  final String email;
  final String? photoProfile;
  final String? bio;
  final int points;
  final String fullName;
  final List<String> groupIds;
  final List<String> enrollCoursesIds;
  final List<String> following;
  final List<String> followers;

  @override
  List<Object?> get props => [
        userId,
        email,
      ];

  @override
  String toString() {
    return 'LocalUser{userId : $userId, email : $email, bio : $bio, points: $points, fullName: $fullName}';
  }

  
}
