import '../data/dummy/dummy_careers.dart';
import '../models/career_model.dart';
import '../models/survey_response_model.dart';

class AppSession {
  static SurveyResponseModel survey = const SurveyResponseModel();

  static List<CareerModel> matchedCareers = dummyCareers;

  static void updateSurvey(SurveyResponseModel value) {
    survey = value;
  }

  static void updateMatchedCareers(List<CareerModel> careers) {
    matchedCareers = careers;
  }

  static void reset() {
    survey = const SurveyResponseModel();
    matchedCareers = dummyCareers;
  }
}