import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: library_prefixes
import 'package:telecom/di/get_it.dart' as getIt;
import 'package:telecom/view/routes/route_name.dart';
import 'package:telecom/view/routes/routes_navigation.dart';
import 'package:telecom/view/theme/theming_app.dart';

void main() {
  getIt.setup();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Telecom App',
      debugShowCheckedModeBanner: false,
      getPages: Routes.routes,
      initialRoute: RouteName.load,
      theme: ThemeApp.light,
      darkTheme: ThemeApp.dark,
      themeMode: ThemeMode.system,
      //home: const MyHomePage(title: 'Telecom Application'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
