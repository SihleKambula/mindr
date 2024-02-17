import 'package:flutter/material.dart';
import 'package:mindr/onboarding/view/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const Mindr());
}

class Mindr extends StatelessWidget {
  const Mindr({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mindr',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          primaryColor: const Color.fromARGB(255, 4, 73, 129),
          fontFamily: 'Poppins'),
      home: const App(),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late SharedPreferences _preferences;
  final String key = 'onboarding';

  @override
  void initState() {
    super.initState();
    _initPreferences();
  }

  Future<void> _initPreferences() async {
    print('starting');
    _preferences = await SharedPreferences.getInstance();
  }

  String _loadData() {
    print('Loading data');
    return _preferences.getString(key) ?? 'No data found';
  }

  @override
  Widget build(BuildContext context) {
    if (_loadData() == 'No data found') {
      return const Onboarding();
    } else {
      return const Wrapper();
    }
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('Mindr'),
    ));
  }
}
