class SurveyState {
  List<String> step1 = [];
  List<String> step2 = [];
  List<String> step3 = [];
  List<String> step4 = [];
  String careerGoal = '';

  void updateStep1(List<String> values) {
    step1 = values;
  }

  void updateStep2(List<String> values) {
    step2 = values;
  }

  void updateStep3(List<String> values) {
    step3 = values;
  }

  void updateStep4(List<String> values) {
    step4 = values;
  }

  void updateCareerGoal(String value) {
    careerGoal = value;
  }

  void reset() {
    step1 = [];
    step2 = [];
    step3 = [];
    step4 = [];
    careerGoal = '';
  }
}