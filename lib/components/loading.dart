import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpinKitCubeGrid(
        color: Color.fromARGB(255, 2, 88, 158),
        size: 60.0,
      )),
    );
  }
}
