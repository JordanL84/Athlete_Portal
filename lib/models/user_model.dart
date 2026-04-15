class UserModel {
  final String id;
  final String name;
  final String email;

  // Survey data (frontend for now, backend later)
  final List<String> experiences;
  final List<String> interests;
  final List<String> skills;
  final List<String> workPreferences;
  final String careerGoal;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.experiences = const [],
    this.interests = const [],
    this.skills = const [],
    this.workPreferences = const [],
    this.careerGoal = '',
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    List<String>? experiences,
    List<String>? interests,
    List<String>? skills,
    List<String>? workPreferences,
    String? careerGoal,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      experiences: experiences ?? this.experiences,
      interests: interests ?? this.interests,
      skills: skills ?? this.skills,
      workPreferences: workPreferences ?? this.workPreferences,
      careerGoal: careerGoal ?? this.careerGoal,
    );
  }
}