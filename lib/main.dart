import 'package:flutter/material.dart';
import 'package:mindr/wrapper.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const Mindr());
}

class Mindr extends StatelessWidget {
  const Mindr({super.key});

  @override
  Widget build(BuildContext context) {
    //routes
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const App()),
        GoRoute(
            path: '/wrapper', builder: ((context, state) => const Wrapper()))
      ],
    );

    return MaterialApp.router(
      title: 'Mindr',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          primaryColor: const Color.fromARGB(255, 4, 73, 129),
          fontFamily: 'Poppins'),
      routerConfig: router,
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const Wrapper();
  }
}
