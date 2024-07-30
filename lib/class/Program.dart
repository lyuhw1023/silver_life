class Program {
  final int id;
  final String title;
  final String time;
  final String subtitle;
  final String imageUrl;

  Program(
      {required this.id,
      required this.title,
      required this.time,
      required this.subtitle,
      required this.imageUrl});

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
        id: json["id"],
        title: json["title"],
        time: json["time"],
        subtitle: json["subtitle"],
        imageUrl: json["imageUrl"]);
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "time": time,
      "subtitle": subtitle,
      "imageUrl": imageUrl,
    };
  }
}
