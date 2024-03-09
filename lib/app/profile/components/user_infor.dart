import 'package:flutter/material.dart';

class UserInfor extends StatelessWidget {
  const UserInfor({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.grey),
                ),
                Text(value)
              ],
            )
          ],
        ));
  }
}
