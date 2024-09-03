import 'package:fluent_ui/fluent_ui.dart';

import 'package:window_manager/window_manager.dart';

import 'app/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  windowManager.waitUntilReadyToShow().then((_) async {
    await windowManager.setTitle('Capelania IBNC');
    await windowManager.setTitleBarStyle(TitleBarStyle.normal);
    await windowManager.setBackgroundColor(Colors.transparent);
    await windowManager.setSize(const Size(800, 600));
    await windowManager.setMinimumSize(const Size(800, 600));
    await windowManager.setMaximumSize(const Size(800, 600));
    await windowManager.center();
    await windowManager.show();
    await windowManager.setSkipTaskbar(false);
  });
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return   FluentApp(
      title: 'Capelania IBNC',
      debugShowCheckedModeBanner: false,
      theme: FluentThemeData(
        brightness: Brightness.light,
        accentColor: Colors.orange
      ),
      darkTheme: FluentThemeData(
        brightness: Brightness.light,
        accentColor: Colors.orange
      ),
      home: const Home(),
    );
  }
}
