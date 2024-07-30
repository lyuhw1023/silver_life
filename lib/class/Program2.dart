class Program {
  final String date;
  final String program1;
  final String program1_time;
  final String program1_desc;
  final String program2;
  final String program2_time;
  final String program2_desc;
  final String photo;

  Program({
    required this.date,
    required this.program1,
    required this.program1_time,
    required this.program1_desc,
    required this.program2,
    required this.program2_time,
    required this.program2_desc,
    required this.photo,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      date: json["date"],
      program1: json["program1"],
      program1_time: json["program1_time"],
      program1_desc: json["program1_desc"],
      program2: json["program2"],
      program2_time: json["program2_time"],
      program2_desc: json["program2_desc"],
      photo: json["photo"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "date": date,
      "program1": program1,
      "program1_time": program1_time,
      "program1_desc": program1_desc,
      "program2": program2,
      "program2_time": program2_time,
      "program2_desc": program2_desc,
      "photo": photo,
    };
  }
}
