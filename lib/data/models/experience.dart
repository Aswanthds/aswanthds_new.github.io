class Experience {
  final String company;
  final String role;
  final String period;
  final String description;
  final List<String> bulletPoints;
  final String? googlePlay;
  final String? appStore;
  final String project;

  const Experience({
    required this.company,
    required this.role,
    required this.period,
    required this.description,
    required this.bulletPoints,
    this.googlePlay,
    this.appStore,
    required this.project,
  });
}
