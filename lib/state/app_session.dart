import '../data/dummy/dummy_careers.dart';
import '../models/career_model.dart';
import '../models/survey_response_model.dart';

class AppSession {
  static SurveyResponseModel survey = const SurveyResponseModel();

  static List<CareerModel> matchedCareers = dummyCareers;

  static String displayName = 'Judah K';
  static String sport = 'Soccer';
  static String directoryId = 'jkamadin';

  static void updateUser({String? name, String? directory, String? sportName}) {
    final trimmedName = name?.trim();
    final trimmedDirectory = directory?.trim();
    final trimmedSport = sportName?.trim();

    if (trimmedName != null && trimmedName.isNotEmpty) {
      displayName = trimmedName;
    }
    if (trimmedDirectory != null && trimmedDirectory.isNotEmpty) {
      directoryId = trimmedDirectory;
    }
    if (trimmedSport != null && trimmedSport.isNotEmpty) {
      sport = trimmedSport;
    }
  }

  static void updateSurvey(SurveyResponseModel value) {
    survey = value;
  }

  static void updateMatchedCareers(List<CareerModel> careers) {
    matchedCareers = careers;
  }

  static void reset() {
    survey = const SurveyResponseModel();
    matchedCareers = dummyCareers;
    displayName = 'Judah K';
    sport = 'Soccer';
    directoryId = 'jkamadin';
  }
}
