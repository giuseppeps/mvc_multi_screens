class LeagueModel {
  final int id;
  final String name;
  final String imageUrl;

  LeagueModel({required this.id, required this.name, required this.imageUrl});

  factory LeagueModel.fromJson(Map<String, dynamic> json) {
    return LeagueModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['emblem'],
    );
  }
}
