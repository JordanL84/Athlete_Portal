import 'package:flutter/material.dart';
import '../../widgets/survey/survey_nav_buttons.dart';
import '../../widgets/survey/survey_progress_header.dart';
import '../dashboard/dashboard_screen.dart';
import 'survey_step_one.dart';
import 'survey_step_two.dart';
import 'survey_step_three.dart';
import 'survey_step_four.dart';

class SurveyScreen extends StatefulWidget {
  static const String routeName = '/survey';

  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  int currentStep = 0;

  List<String> selectedStep1 = [];
  List<String> selectedStep2 = [];
  List<String> selectedStep3 = [];
  List<String> selectedStep4 = [];
  String careerGoal = '';

  void nextStep() {
    if (currentStep < 3) {
      setState(() {
        currentStep++;
      });
    } else {
      Navigator.pushReplacementNamed(
        context,
        DashboardScreen.routeName,
      );
    }
  }

  void prevStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final stepTitles = [
      'Experiences & Activities',
      'Academic & Career Interests',
      'Skills & Strengths',
      'Work Preferences & Goals',
    ];

    final stepSubtitles = [
      'Select all that apply to you.',
      'Choose the areas that interest you most.',
      'Pick the skills that best describe you.',
      'Tell us how you like to work and what you want to do.',
    ];

    final steps = [
      SurveyStepOne(
        selected: selectedStep1,
        onChanged: (val) => setState(() => selectedStep1 = val),
      ),
      SurveyStepTwo(
        selected: selectedStep2,
        onChanged: (val) => setState(() => selectedStep2 = val),
      ),
      SurveyStepThree(
        selected: selectedStep3,
        onChanged: (val) => setState(() => selectedStep3 = val),
      ),
      SurveyStepFour(
        selected: selectedStep4,
        careerGoal: careerGoal,
        onChanged: (val) => setState(() => selectedStep4 = val),
        onGoalChanged: (val) => setState(() => careerGoal = val),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SurveyProgressHeader(
                currentStep: currentStep + 1,
                totalSteps: 4,
                title: stepTitles[currentStep],
                subtitle: stepSubtitles[currentStep],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: steps[currentStep],
              ),
              const SizedBox(height: 16),
              SurveyNavButtons(
                onNext: nextStep,
                onBack: currentStep > 0 ? prevStep : null,
                isLastStep: currentStep == 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}