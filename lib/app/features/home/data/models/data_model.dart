import 'package:equatable/equatable.dart';

class DataModel extends Equatable {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const DataModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        completed: json['completed'],
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['completed'] = completed;
    return data;
  }

  @override
  List<Object?> get props => [
        userId,
        id,
        title,
        completed,
      ];
}
