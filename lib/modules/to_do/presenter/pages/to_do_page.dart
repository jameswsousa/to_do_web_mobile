import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tripduu/core/theme/app_colors.dart';
import 'package:tripduu/core/utils/strings.dart';
import '../../../../core/enum/list_enum.dart';
import '../../models/task_model.dart';
import '../components/tasks_column.dart';
import '../controller/to_do_controller.dart';

final _controller = Modular.get<ToDoController>();

class ToDoPage extends StatefulWidget {
  ToDoPage();
  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final scrollController = ScrollController();
  final List<String> _colorsText = [Strings.green, Strings.yellow, Strings.red];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appbar,
          title: Text(Strings.toDoList,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Observer(
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            width: 350,
                            height: 250,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Text(Strings.color),
                                  SizedBox(width: 16),
                                  PopupMenuButton<int>(
                                    onSelected: (value) {
                                      _controller.selected = value;
                                      _controller.color =
                                          _controller.appColors[value];
                                      setState(() {});
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return List.generate(
                                          _colorsText.length,
                                          (index) => PopupMenuItem<int>(
                                              value: index,
                                              child: Text(
                                                _colorsText[index],
                                              )));
                                    },
                                    child: Row(
                                      children: [
                                        Text(_colorsText[_controller.selected]),
                                        SizedBox(width: 5),
                                        Icon(Icons.arrow_drop_down)
                                      ],
                                    ),
                                  )
                                ]),
                                TextField(
                                  onChanged: (value) {
                                    _controller.text = value;
                                    setState(() {});
                                  },
                                  cursorColor: AppColors.text,
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: _controller.color,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors.text)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors.text))),
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                      shadowColor: MaterialStateProperty.all(
                                          Colors.black),
                                      elevation: MaterialStateProperty.all(3),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              _controller.color),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)))),
                                  onPressed: _controller.text == ''
                                      ? () => Navigator.pop(context)
                                      : () {
                                          _controller.toDo.add(TaskModel(
                                              list: ToDoEnum.toDo,
                                              color: _controller.color,
                                              text: _controller.text));
                                          _controller.text = '';
                                          Navigator.pop(context);
                                          setState(() {});
                                        },
                                  child: Text(Strings.add,
                                      style: TextStyle(color: Colors.black)),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  });
            }),
        body: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          child: Container(
            color: AppColors.background,
            height: MediaQuery.of(context).size.height,
            width: kIsWeb
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width * 1.8,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Observer(
                      builder: (context) {
                        return TasksColumn(
                          function: (a) {
                            setState(() {});
                          },
                          acceptWithDetails: acceptWithDetails,
                          scrollController: scrollController,
                          addOnNew: (task) {
                            _controller.toDo
                                .add(task.copyWith(list: ToDoEnum.toDo));
                          },
                          list: _controller.toDo,
                          color: AppColors.purple,
                          text: Strings.toDo,
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Observer(
                      builder: (context) {
                        return TasksColumn(
                            function: (a) {
                              setState(() {});
                            },
                            addOnNew: (task) {
                              _controller.doing
                                  .add(task.copyWith(list: ToDoEnum.doing));
                            },
                            list: _controller.doing,
                            text: Strings.doing,
                            color: AppColors.orange,
                            scrollController: scrollController,
                            acceptWithDetails: acceptWithDetails);
                      },
                    ),
                  ),
                  Expanded(
                    child: Observer(
                      builder: (context) {
                        return TasksColumn(
                          function: (a) {
                            setState(() {});
                          },
                          addOnNew: (task) {
                            _controller.done
                                .add(task.copyWith(list: ToDoEnum.done));
                          },
                          scrollController: scrollController,
                          list: _controller.done,
                          text: Strings.done,
                          color: AppColors.blue,
                          acceptWithDetails: acceptWithDetails,
                        );
                      },
                    ),
                  ),
                ]),
          ),
        ));
  }

  void acceptWithDetails(DragTargetDetails<TaskModel> details) {
    if (details.data.list == ToDoEnum.toDo) {
      _controller.toDo.remove(details.data);
    }
    if (details.data.list == ToDoEnum.doing) {
      _controller.doing.remove(details.data);
    }
    if (details.data.list == ToDoEnum.done) {
      _controller.done.remove(details.data);
    }
  }
}
