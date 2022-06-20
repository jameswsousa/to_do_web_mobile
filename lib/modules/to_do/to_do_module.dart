import 'package:flutter_modular/flutter_modular.dart';
import 'package:tripduu/modules/to_do/presenter/controller/to_do_controller.dart';
import 'package:tripduu/modules/to_do/presenter/pages/to_do_page.dart';

class ToDoModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => ToDoController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => ToDoPage()),
      ];
}
