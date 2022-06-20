import 'package:flutter/cupertino.dart';

import 'package:tripduu/core/enum/list_enum.dart';

class TaskModel {
  final Color color;
  final String text;
  final ToDoEnum list;

  TaskModel({required this.list, required this.color, required this.text});

  TaskModel copyWith({
    Color? color,
    String? text,
    ToDoEnum? list,
  }) {
    return TaskModel(
      color: color ?? this.color,
      text: text ?? this.text,
      list: list ?? this.list,
    );
  }
}
