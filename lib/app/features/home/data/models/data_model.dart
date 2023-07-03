import 'package:equatable/equatable.dart';

final class DataModel extends Equatable {
  final String? id;
  final String name;
  final String email;
  final int age;
  final String phone;
  final String description;
  final String image;

  const DataModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.age,
      required this.phone,
      required this.description,
      required this.image});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      age: json['age'],
      phone: json['phone'],
      description: json['description'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['age'] = this.age;
    data['phone'] = this.phone;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        age,
        phone,
        description,
        image,
      ];
}
