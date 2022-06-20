import 'package:flutter/material.dart';

import '../../models/task_model.dart';

class DraggableWidget extends StatelessWidget {
  const DraggableWidget({required this.task, required this.function});

  final TaskModel task;
  final Function(DraggableDetails) function;

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable<TaskModel>(
      delay: Duration.zero,
      childWhenDragging: Container(),
      data: task,
      onDragEnd: function,
      feedback: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: Colors.white)),
          color: task.color,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('...'),
          )),
      child: Row(
        children: [
          Expanded(
            child: Card(
                shadowColor: task.color,
                elevation: 2,
                color: task.color,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(task.text),
                )),
          ),
        ],
      ),
    );
  }
}
