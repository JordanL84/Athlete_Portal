import '../../models/career_model.dart';
import '../../models/survey_response_model.dart';
import '../../services/matching_service.dart';

class SurveyRepository {
  List<CareerModel> submitSurvey(SurveyResponseModel survey) {
    return MatchingService.getMatches(survey);
  }
}