import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tripduu/core/theme/app_colors.dart';
import 'package:tripduu/modules/to_do/models/task_model.dart';

part 'to_do_controller.g.dart';

class ToDoController = _ToDoControllerBase with _$ToDoController;

abstract class _ToDoControllerBase with Store {
  @observable
  List<TaskModel> toDo = [];

  @observable
  List<TaskModel> doing = [];

  @observable
  List<TaskModel> done = [];

  @observable
  Color color = AppColors.green;

  @observable
  String text = '';

  @observable
  int selected = 0;

  List<Color> appColors = [
    AppColors.green,
    AppColors.yellow,
    AppColors.red,
  ];
}
