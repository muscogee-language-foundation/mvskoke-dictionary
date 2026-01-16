import 'package:flutter/material.dart';
import 'package:mvskoke_dictionary/database/database_helper.dart';
import 'package:mvskoke_dictionary/services/service_locator.dart';
import 'package:mvskoke_dictionary/widgets/home_screen.dart';

/// Flutter code sample for [SearchBar].

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  // await getIt<Settings>().init();
  final dbHelper = getIt<DatabaseHelper>();
  // await dbHelper.init();
  // await getIt<Settings>().resetAll();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
    );

    return MaterialApp(
      theme: themeData,
      home: Scaffold(
        appBar: AppBar(title: const Text('Mvskoke Dictionary')),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.grey),
                child: SizedBox(height: 20),
              ),
              ListTile(leading: Icon(Icons.home), title: Text('Home')),
              ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
              // dark mode
              ListTile(
                leading: isDark
                    ? Icon(Icons.wb_sunny_outlined)
                    : Icon(Icons.brightness_2_outlined),
                title: isDark ? Text('Light Mode') : Text('Dark Mode'),
                onTap: () {
                  setState(() {
                    isDark = !isDark;
                  });
                },
              ),
            ],
          ),
        ),
        body: HomePage(),
      ),
    );
  }
}
