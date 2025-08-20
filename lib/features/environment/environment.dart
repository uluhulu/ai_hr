class Environment {
  final EnvironmentType type;
  final Uri apiUrl;
  final Uri baseUrl;

  const Environment({
    required this.type,
    required this.apiUrl,
    required this.baseUrl,
  });

  factory Environment.fromString(String? flavor) => switch (flavor) {
    'dev' => Environment(
      type: EnvironmentType.dev,
      apiUrl: Uri.parse(''),
      baseUrl: Uri.parse(''),
    ),
    'stage' => Environment(
      type: EnvironmentType.dev,
      apiUrl: Uri.parse(''),
      baseUrl: Uri.parse(''),
    ),
    'prod' => Environment(
      type: EnvironmentType.dev,
      apiUrl: Uri.parse(''),
      baseUrl: Uri.parse(''),
    ),
    _ => throw Exception("Unknown flavor: $flavor"),
  };
}

enum EnvironmentType { dev, stage, prod }
