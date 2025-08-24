class Club {
  final String id;
  final String name;
  final String? imageUrl;
  final int? position;
  final String? league;

  Club({
    required this.id,
    required this.name,
    this.imageUrl,
    this.position,
    this.league,
  });
}
