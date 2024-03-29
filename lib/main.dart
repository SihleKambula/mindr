import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mindr/app/single_notes/view.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

//providers
import 'package:mindr/auth/login/viewmodal/login_controller.dart';
import 'package:mindr/auth/signup/viewmodal/signup_controller.dart';

//screens
import 'package:mindr/app/main_app.dart';
import 'package:mindr/auth/auth_main.dart';

import 'onboarding/view/onboarding.dart';

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
        GoRoute(
            path: '/singleview/:id',
            builder: (context, state) =>
                SingleNotesView(id: state.pathParameters['id']!)),
      ],
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpAuth()),
        ChangeNotifierProvider(create: (_) => LoginAuth()),
      ],
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
          return const Main();
        } else {
          return const AuthMainScreen();
        }
      },
    ));
  }
}
