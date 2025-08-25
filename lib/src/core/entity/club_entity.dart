class Club {
  final int id;
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

  factory Club.empty() {
    return Club(id: 0, name: '', imageUrl: null, position: null, league: null);
  }
}
