
class Localdata {
  String? name;
  String? mobilenumber;

  Localdata({
    this.name,
    this.mobilenumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mobile': mobilenumber,
    };
  }

  factory Localdata.fromMap(Map<String, dynamic> map) {
    return Localdata(
      name: map['name'],
      mobilenumber: map['API_DateTime'].toString(),
    );
  }
}