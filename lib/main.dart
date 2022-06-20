import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'core/utils/strings.dart';
import 'modules/to_do/presenter/pages/to_do_page.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'modules/to_do/to_do_module.dart';

Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://a96e61cc5c3240e581c6719c9b123489@o1293536.ingest.sentry.io/6516148';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(ModularApp(
      module: ToDoModule(),
      child: MyApp(),
    )),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.toDoList,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Lato'),
      home: ToDoPage(),
    );
    
  }
}
