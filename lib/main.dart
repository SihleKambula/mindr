import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mindr/auth/signup/viewmodal/signup_controller.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

//Screens
import 'package:mindr/app/home_screen/view/home_screen.dart';
import 'package:mindr/auth/signup/view/signup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Mindr());
}

// Mindr
class Mindr extends StatelessWidget {
  const Mindr({super.key});

  @override
  Widget build(BuildContext context) {
    //routes
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const App()),
      ],
    );

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SignUpAuth())],
      child: MaterialApp.router(
        title: 'Mindr',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            primaryColor: const Color.fromARGB(255, 4, 73, 129),
            fontFamily: 'Poppins'),
        routerConfig: router,
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomeScreen();
        } else {
          return const SignUpScreen();
        }
      },
    ));
  }
}
