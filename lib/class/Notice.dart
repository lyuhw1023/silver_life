class Notice {
  final int id;
  final String title;
  final String description;
  final String time;

  Notice(
      {required this.id,
      required this.title,
      required this.description,
      required this.time});

  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      time: json["time"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "time": time,
    };
  }
}
