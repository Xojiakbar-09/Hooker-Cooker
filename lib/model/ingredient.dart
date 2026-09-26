class Ingredient {
  final int? id;
  final String name;
  final String amount;
  bool isChecked;

  String get nomi => name;
  String get miqdori => amount;
  
  Ingredient({
    this.id,
    required this.name,
    required this.amount,
    this.isChecked = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'isChecked': isChecked ? 1 : 0,
    };
  }

  factory Ingredient.fromMap(Map<String, dynamic> map) {
    return Ingredient(
      id: map['id'] as int?,
      name: map['name']?.toString() ?? '',
      amount: map['amount']?.toString() ?? '',
      isChecked: map['isChecked'] == 1 || map['isChecked'] == true,
    );
  }
}
