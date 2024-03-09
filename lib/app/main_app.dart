import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mindr/app/notes/view.dart';
import 'package:mindr/app/profile/view.dart';
import 'package:mindr/app/reminders/view.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int selectedScreen = 0;

  List<Widget> screens = [
    const NoteScreen(),
    const Reminders(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedScreen],
      bottomNavigationBar: NavigationBar(
        elevation: 0,
        height: 60,
        selectedIndex: selectedScreen,
        indicatorColor: const Color.fromARGB(73, 0, 140, 255),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (value) {
          setState(() {
            selectedScreen = value;
          });
        },
        destinations: const [
          NavigationDestination(
              icon: Icon(
                Iconsax.note,
              ),
              label: 'notes'),
          NavigationDestination(icon: Icon(Iconsax.task), label: 'reminders'),
          NavigationDestination(icon: Icon(Iconsax.user), label: 'profile')
        ],
      ),
    );
  }
}
