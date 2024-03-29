import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class Reminders extends StatefulWidget {
  const Reminders({super.key});

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reminders'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => print('Recording'),
          child: const Icon(Iconsax.microphone),
        ),
        backgroundColor: Colors.grey[100],
        body: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: 5,
          itemBuilder: (context, index) {
            final item = index;
            return InkWell(
              onTap: null,
              child: Dismissible(
                key: Key('hello'),
                onDismissed: (direction) {
                  print(index);
                },
                background: Container(color: Colors.red),
                child: const Card(
                  elevation: 0,
                  child: ListTile(
                    title: Text('The Reminder'),
                    tileColor: Colors.white,
                    subtitle: Text('The Date'),
                    trailing: Icon(Iconsax.arrow_circle_right),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
