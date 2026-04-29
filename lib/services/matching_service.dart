import '../data/dummy/dummy_careers.dart';
import '../models/career_model.dart';
import '../models/survey_response_model.dart';

class MatchingService {
  static List<CareerModel> getMatches(SurveyResponseModel survey) {
    final Map<String, double> surveyProfile = _buildSurveyProfile(survey);

    final scoredCareers = dummyCareers.map((career) {
      final careerProfile = _careerProfiles[career.id] ?? {};
      final score = _calculateWeightedScore(
        surveyProfile: surveyProfile,
        careerProfile: careerProfile,
      );

      return CareerModel(
        id: career.id,
        title: career.title,
        description: career.description,
        matchPercent: score,
        tags: career.tags,
      );
    }).toList();

    scoredCareers.sort((a, b) => b.matchPercent.compareTo(a.matchPercent));
    return scoredCareers;
  }

  static Map<String, double> _buildSurveyProfile(SurveyResponseModel survey) {
    final profile = <String, double>{};

    void addWeight(String key, double amount) {
      profile[key] = (profile[key] ?? 0) + amount;
    }

    for (final item in survey.experiences) {
      for (final category
          in (_experienceToCategories[item] ?? const <String, double>{})
              .entries) {
        addWeight(category.key, category.value);
      }
    }

    for (final item in survey.interests) {
      for (final category
          in (_interestToCategories[item] ?? const <String, double>{}).entries) {
        addWeight(category.key, category.value);
      }
    }

    for (final item in survey.skills) {
      for (final category
          in (_skillToCategories[item] ?? const <String, double>{}).entries) {
        addWeight(category.key, category.value);
      }
    }

    for (final item in survey.workPreferences) {
      for (final category
          in (_workPreferenceToCategories[item] ?? const <String, double>{})
              .entries) {
        addWeight(category.key, category.value);
      }
    }

    final goalText = survey.careerGoal.toLowerCase();

    for (final keyword in _goalKeywordCategories.keys) {
      if (goalText.contains(keyword)) {
        for (final category in _goalKeywordCategories[keyword]!.entries) {
          addWeight(category.key, category.value);
        }
      }
    }

    return profile;
  }

  static double _calculateWeightedScore({
    required Map<String, double> surveyProfile,
    required Map<String, double> careerProfile,
  }) {
    double earned = 0;
    double possible = 0;

    for (final entry in careerProfile.entries) {
      final category = entry.key;
      final desiredWeight = entry.value;
      final userWeight = surveyProfile[category] ?? 0;

      possible += desiredWeight;
      earned += userWeight < desiredWeight ? userWeight : desiredWeight;
    }

    if (possible == 0) return 0;

    final normalized = (earned / possible) * 100;

    if (normalized < 35) return 35;
    if (normalized > 98) return 98;

    return normalized.roundToDouble();
  }

  static const Map<String, Map<String, double>> _experienceToCategories = {
    'Leadership roles (team captain, club leader)': {
      'leadership': 3,
      'teamwork': 2,
      'management': 2,
    },
    'Team-based activities': {
      'teamwork': 3,
      'collaboration': 2,
    },
    'Volunteer work': {
      'service': 3,
      'communication': 1,
    },
    'Research projects': {
      'research': 3,
      'analytics': 2,
      'problem_solving': 1,
    },
    'Event planning': {
      'management': 2,
      'organization': 3,
      'operations': 2,
    },
    'Mentoring / tutoring': {
      'teaching': 3,
      'communication': 2,
      'service': 1,
    },
    'Content creation (social media, video)': {
      'marketing': 2,
      'media': 3,
      'creativity': 2,
      'communication': 2,
    },
    'Data / analytics projects': {
      'analytics': 3,
      'data': 3,
      'problem_solving': 1,
    },
    'Tech / coding projects': {
      'technology': 3,
      'data': 1,
      'problem_solving': 2,
    },
  };

  static const Map<String, Map<String, double>> _interestToCategories = {
    'Business & Management': {
      'business': 3,
      'management': 3,
    },
    'Marketing & Communications': {
      'marketing': 3,
      'communication': 3,
      'media': 1,
    },
    'Finance': {
      'finance': 3,
      'analytics': 1,
      'data': 1,
    },
    'Data & Analytics': {
      'analytics': 3,
      'data': 3,
      'research': 1,
    },
    'Technology': {
      'technology': 3,
      'problem_solving': 1,
    },
    'Health & Wellness': {
      'health': 3,
      'service': 1,
    },
    'Education & Coaching': {
      'teaching': 3,
      'leadership': 1,
      'service': 1,
    },
    'Media & Journalism': {
      'media': 3,
      'communication': 2,
      'creativity': 1,
    },
    'Psychology / Human Behavior': {
      'psychology': 3,
      'research': 1,
      'service': 1,
    },
    'Sports Administration': {
      'sports': 3,
      'management': 2,
      'operations': 2,
    },
  };

  static const Map<String, Map<String, double>> _skillToCategories = {
    'Leadership': {
      'leadership': 3,
      'management': 2,
    },
    'Communication': {
      'communication': 3,
      'media': 1,
    },
    'Problem Solving': {
      'problem_solving': 3,
      'analytics': 1,
      'technology': 1,
    },
    'Teamwork': {
      'teamwork': 3,
      'collaboration': 2,
    },
    'Creativity': {
      'creativity': 3,
      'marketing': 1,
      'media': 1,
    },
    'Analytical Thinking': {
      'analytics': 3,
      'data': 2,
      'research': 1,
    },
    'Organization': {
      'organization': 3,
      'operations': 2,
    },
    'Adaptability': {
      'operations': 1,
      'teamwork': 1,
    },
    'Public Speaking': {
      'communication': 3,
      'leadership': 1,
    },
    'Mentoring': {
      'teaching': 3,
      'service': 1,
      'leadership': 1,
    },
    'Technical Skills': {
      'technology': 3,
      'data': 1,
    },
    'Attention to Detail': {
      'data': 2,
      'finance': 2,
      'organization': 1,
    },
  };

  static const Map<String, Map<String, double>> _workPreferenceToCategories = {
    'Team-based collaborative environment': {
      'teamwork': 3,
      'collaboration': 3,
    },
    'Independent work': {
      'research': 1,
      'focus': 2,
    },
    'Mix of both': {
      'teamwork': 1,
      'collaboration': 1,
      'focus': 1,
    },
    'Fast-paced environment': {
      'operations': 2,
      'sports': 1,
    },
    'Structured / routine work': {
      'organization': 2,
      'finance': 1,
    },
    'Creative / flexible work': {
      'creativity': 3,
      'media': 1,
      'marketing': 1,
    },
    'Helping others directly': {
      'service': 3,
      'teaching': 1,
      'health': 1,
    },
    'Working with data / numbers': {
      'data': 3,
      'analytics': 3,
      'finance': 1,
    },
    'Leading people / projects': {
      'leadership': 3,
      'management': 3,
    },
    'Public-facing communication work': {
      'communication': 3,
      'marketing': 1,
      'media': 2,
    },
  };

  static const Map<String, Map<String, double>> _goalKeywordCategories = {
    'analytics': {
      'analytics': 3,
      'data': 2,
    },
    'data': {
      'data': 3,
      'analytics': 2,
    },
    'business': {
      'business': 3,
      'management': 1,
    },
    'marketing': {
      'marketing': 3,
      'communication': 1,
    },
    'media': {
      'media': 3,
      'communication': 1,
    },
    'sports': {
      'sports': 3,
      'operations': 1,
    },
    'coach': {
      'teaching': 2,
      'leadership': 1,
    },
    'finance': {
      'finance': 3,
      'data': 1,
    },
    'technology': {
      'technology': 3,
    },
    'psychology': {
      'psychology': 3,
      'service': 1,
    },
  };

  static const Map<String, Map<String, double>> _careerProfiles = {
    'business_analytics': {
      'analytics': 3,
      'data': 3,
      'business': 3,
      'problem_solving': 2,
      'research': 1,
      'organization': 1,
    },
    'sports_management': {
      'sports': 3,
      'management': 3,
      'leadership': 3,
      'operations': 2,
      'teamwork': 2,
      'communication': 1,
    },
    'sports_marketing': {
      'sports': 2,
      'marketing': 3,
      'media': 2,
      'communication': 3,
      'creativity': 2,
      'teamwork': 1,
    },
  };
}