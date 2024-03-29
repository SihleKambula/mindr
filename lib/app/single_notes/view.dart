import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class SingleNotesView extends StatefulWidget {
  final String id;
  const SingleNotesView({super.key, required this.id});

  @override
  State<SingleNotesView> createState() => _SingleNotesViewState();
}

class _SingleNotesViewState extends State<SingleNotesView> {
  TextEditingController textController =
      TextEditingController(text: 'The data');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mindr'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              //set the new text field data to link with the data base
              context.go('/');
            },
            icon: const Icon(Iconsax.back_square)),
        actions: [
          IconButton(
              onPressed: () => print('Share to notion'),
              icon: const Icon(Iconsax.export))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          decoration: const InputDecoration(border: InputBorder.none),
          controller: textController,
          maxLines: null,
        ),
      ),
    );
  }
}
