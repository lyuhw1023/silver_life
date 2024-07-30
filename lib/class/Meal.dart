class Meal {
  final int type;
  final String menu1;
  final String menu2;
  final String menu3;
  final String menu4;
  final String menu5;
  final String menu6;

  Meal({
    required this.type,
    required this.menu1,
    required this.menu2,
    required this.menu3,
    required this.menu4,
    required this.menu5,
    required this.menu6,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      type: json["type"],
      menu1: json["menu1"],
      menu2: json["menu2"],
      menu3: json["menu3"],
      menu4: json["menu4"],
      menu5: json["menu5"],
      menu6: json["menu6"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "menu1": menu1,
      "menu2": menu2,
      "menu3": menu3,
      "menu4": menu4,
      "menu5": menu5,
      "menu6": menu6,
    };
  }
}
