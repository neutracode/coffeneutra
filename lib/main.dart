import 'package:flutter/material.dart';
import 'package:portofolio/data/model/experience.dart';
import 'package:portofolio/static/navigation_route.dart';
import 'package:portofolio/style/theme.dart';
import 'package:portofolio/style/util.dart';
import 'package:portofolio/ui/dashboard.dart';
import 'package:portofolio/ui/detail_exp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    TextTheme textTheme = createTextTheme(context, "Voltaire", "Voltaire");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      initialRoute: NavigationRoute.dashBoard.name,
      routes: {
        NavigationRoute.dashBoard.name: (context) => const Dashboard(),
        NavigationRoute.detailExp.name: (context) {
          final experience =
              ModalRoute.of(context)!.settings.arguments as Experience;
          return DetailExp(experience: experience);
        },
      },
    );
  }
}
