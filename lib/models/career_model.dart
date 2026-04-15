class CareerModel {
  final String id;
  final String title;
  final String description;
  final double matchPercent;
  final List<String> tags;

  const CareerModel({
    required this.id,
    required this.title,
    required this.description,
    required this.matchPercent,
    required this.tags,
  });
}