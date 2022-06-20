import 'package:flutter/material.dart';
import 'package:tripduu/core/theme/app_colors.dart';
import '../../models/task_model.dart';
import 'draggable_widget.dart';

class TasksColumn extends StatelessWidget {
  const TasksColumn(
      {required this.list,
      required this.color,
      required this.text,
      required this.addOnNew,
      required this.scrollController,
      required this.acceptWithDetails,
      required this.function});

  final List<TaskModel> list;
  final Function(TaskModel) addOnNew;
  final Function(DraggableDetails) function;
  final Function(DragTargetDetails<TaskModel>) acceptWithDetails;
  final Color color;
  final String text;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return DragTarget<TaskModel>(
      onAcceptWithDetails: acceptWithDetails,
      onAccept: addOnNew,
      builder: (context, _, __) {
        return Container(
          margin: EdgeInsets.all(MediaQuery.of(context).size.width * .02),
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .03),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(20)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(text,
                      style: TextStyle(
                          fontSize: 25,
                          color: AppColors.text,
                          fontWeight: FontWeight.bold)),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: list.isEmpty
                        ? [Container(height: 100)]
                        : list
                                .map((e) => Listener(
                                    onPointerMove: (PointerMoveEvent event) {
                                      if (event.position.dx >
                                          (MediaQuery.of(context).size.width -
                                              50)) {
                                        scrollController.animateTo(
                                          scrollController.offset + 120,
                                          curve: Curves.linear,
                                          duration: Duration(milliseconds: 100),
                                        );
                                      } else if (event.position.dx < 50) {
                                        scrollController.animateTo(
                                          scrollController.offset - 120,
                                          curve: Curves.linear,
                                          duration: Duration(milliseconds: 100),
                                        );
                                      }
                                    },
                                    child: DraggableWidget(
                                        task: e, function: function)))
                                .toList() +
                            [Listener(child: Container(height: 50))])
              ],
            ),
          ),
        );
      },
    );
  }
}
