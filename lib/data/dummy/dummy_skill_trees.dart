import '../../models/skill_node_model.dart';

final Map<String, List<SkillNodeModel>> dummySkillTrees = {
  'business_analytics': [
    // FOUNDATION
    const SkillNodeModel(
      id: 'data_analysis',
      title: 'Data Analysis Basics',
      level: 'Foundation',
      description: 'Learn how to interpret and analyze data.',
      isUnlocked: true,
      isCompleted: true, // auto completed from survey example
    ),
    const SkillNodeModel(
      id: 'excel',
      title: 'Excel & Spreadsheets',
      level: 'Foundation',
      description: 'Use Excel for data organization and calculations.',
      isUnlocked: true,
    ),
    const SkillNodeModel(
      id: 'business_fundamentals',
      title: 'Business Fundamentals',
      level: 'Foundation',
      description: 'Understand core business concepts and terminology.',
      isUnlocked: true,
    ),

    // INTERMEDIATE
    const SkillNodeModel(
      id: 'data_visualization',
      title: 'Data Visualization',
      level: 'Intermediate',
      description: 'Create charts and dashboards to present insights.',
      prerequisiteIds: ['data_analysis'],
    ),
    const SkillNodeModel(
      id: 'sql',
      title: 'SQL & Databases',
      level: 'Intermediate',
      description: 'Query and manage structured data.',
      prerequisiteIds: ['data_analysis', 'excel'],
    ),
    const SkillNodeModel(
      id: 'statistics',
      title: 'Statistics',
      level: 'Intermediate',
      description: 'Understand probability and statistical methods.',
      prerequisiteIds: ['data_analysis'],
    ),

    // ADVANCED
    const SkillNodeModel(
      id: 'machine_learning',
      title: 'Machine Learning Basics',
      level: 'Advanced',
      description: 'Learn predictive modeling techniques.',
      prerequisiteIds: ['statistics', 'sql'],
    ),
    const SkillNodeModel(
      id: 'business_strategy',
      title: 'Business Strategy',
      level: 'Advanced',
      description: 'Apply analytics to real business decisions.',
      prerequisiteIds: ['business_fundamentals', 'data_visualization'],
    ),

    // EXPERT
    const SkillNodeModel(
      id: 'capstone_project',
      title: 'Capstone Analytics Project',
      level: 'Expert',
      description: 'Complete a real-world analytics project.',
      prerequisiteIds: ['machine_learning', 'business_strategy'],
    ),
  ],

  'sports_management': [
    const SkillNodeModel(
      id: 'leadership_management',
      title: 'Leadership & Management',
      level: 'Foundation',
      description: 'Lead teams, make strategic decisions, and manage resources',
      isUnlocked: true,
      isCompleted: true,
    ),
    const SkillNodeModel(
      id: 'budget_financial_planning',
      title: 'Budget & Financial Planning',
      level: 'Foundation',
      description:
          'Create budgets, manage revenue streams, and control operational costs',
      isUnlocked: true,
      isCompleted: true,
    ),
    const SkillNodeModel(
      id: 'event_planning_operations',
      title: 'Event Planning & Operations',
      level: 'Foundation',
      description:
          'Organize tournaments, manage game day operations, and coordinate logistics',
      isUnlocked: true,
      isCompleted: true,
    ),
    const SkillNodeModel(
      id: 'contract_negotiation',
      title: 'Contract Negotiation',
      level: 'Intermediate',
      description:
          'Negotiate sponsorships, vendor contracts, and partnership agreements',
      prerequisiteIds: ['leadership_management'],
    ),
    const SkillNodeModel(
      id: 'facility_management',
      title: 'Facility Management',
      level: 'Intermediate',
      description:
          'Oversee venue operations, maintenance, and safety protocols',
      prerequisiteIds: ['budget_financial_planning'],
    ),
    const SkillNodeModel(
      id: 'marketing_promotions',
      title: 'Marketing & Promotions',
      level: 'Intermediate',
      description:
          'Promote programs, engage fans, and build community relationships',
      prerequisiteIds: ['event_planning_operations'],
    ),
    const SkillNodeModel(
      id: 'legal_compliance',
      title: 'Legal & Compliance',
      level: 'Intermediate',
      description:
          'Understand NCAA regulations, Title IX, and sports law fundamentals',
      prerequisiteIds: ['contract_negotiation'],
    ),
    const SkillNodeModel(
      id: 'crisis_management',
      title: 'Crisis Management',
      level: 'Intermediate',
      description:
          'Handle emergencies, media relations, and unexpected challenges',
      prerequisiteIds: ['facility_management'],
    ),
  ],

  'sports_marketing': [
    const SkillNodeModel(
      id: 'social_media',
      title: 'Social Media Marketing',
      level: 'Foundation',
      isUnlocked: true,
    ),
    const SkillNodeModel(
      id: 'branding',
      title: 'Brand Strategy',
      level: 'Intermediate',
      prerequisiteIds: ['social_media'],
    ),
  ],
};
