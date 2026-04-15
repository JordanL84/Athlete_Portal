class SurveyResponseModel {
  final List<String> experiences;
  final List<String> interests;
  final List<String> skills;
  final List<String> workPreferences;
  final String careerGoal;

  const SurveyResponseModel({
    this.experiences = const [],
    this.interests = const [],
    this.skills = const [],
    this.workPreferences = const [],
    this.careerGoal = '',
  });

  SurveyResponseModel copyWith({
    List<String>? experiences,
    List<String>? interests,
    List<String>? skills,
    List<String>? workPreferences,
    String? careerGoal,
  }) {
    return SurveyResponseModel(
      experiences: experiences ?? this.experiences,
      interests: interests ?? this.interests,
      skills: skills ?? this.skills,
      workPreferences: workPreferences ?? this.workPreferences,
      careerGoal: careerGoal ?? this.careerGoal,
    );
  }
}