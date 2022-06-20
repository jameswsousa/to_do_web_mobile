// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_do_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ToDoController on _ToDoControllerBase, Store {
  late final _$toDoAtom =
      Atom(name: '_ToDoControllerBase.toDo', context: context);

  @override
  List<TaskModel> get toDo {
    _$toDoAtom.reportRead();
    return super.toDo;
  }

  @override
  set toDo(List<TaskModel> value) {
    _$toDoAtom.reportWrite(value, super.toDo, () {
      super.toDo = value;
    });
  }

  late final _$doingAtom =
      Atom(name: '_ToDoControllerBase.doing', context: context);

  @override
  List<TaskModel> get doing {
    _$doingAtom.reportRead();
    return super.doing;
  }

  @override
  set doing(List<TaskModel> value) {
    _$doingAtom.reportWrite(value, super.doing, () {
      super.doing = value;
    });
  }

  late final _$doneAtom =
      Atom(name: '_ToDoControllerBase.done', context: context);

  @override
  List<TaskModel> get done {
    _$doneAtom.reportRead();
    return super.done;
  }

  @override
  set done(List<TaskModel> value) {
    _$doneAtom.reportWrite(value, super.done, () {
      super.done = value;
    });
  }

  late final _$colorAtom =
      Atom(name: '_ToDoControllerBase.color', context: context);

  @override
  Color get color {
    _$colorAtom.reportRead();
    return super.color;
  }

  @override
  set color(Color value) {
    _$colorAtom.reportWrite(value, super.color, () {
      super.color = value;
    });
  }

  late final _$textAtom =
      Atom(name: '_ToDoControllerBase.text', context: context);

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  late final _$selectedAtom =
      Atom(name: '_ToDoControllerBase.selected', context: context);

  @override
  int get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(int value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  @override
  String toString() {
    return '''
toDo: ${toDo},
doing: ${doing},
done: ${done},
color: ${color},
text: ${text},
selected: ${selected}
    ''';
  }
}
