class Ingredient {
  final int? id;
  final String name;
  final String amount;

  Ingredient({
    this.id,
    required this.name,
    required this.amount,
  });

  // SQFlite bazasiga saqlash uchun Map'ga o'tkazish
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
    };
  }

  // Bazadan o'qib olish uchun Map'dan obyektga o'tkazish
  factory Ingredient.fromMap(Map<String, dynamic> map) {
    return Ingredient(
      id: map['id'],
      name: map['name'],
      amount: map['amount'],
    );
  }
}