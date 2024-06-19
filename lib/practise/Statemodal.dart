
class StateModel {
  final String code;
  final String name;

  StateModel({required this.code, required this.name});

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      code: json['code'],
      name: json['name'],
    );
  }
}