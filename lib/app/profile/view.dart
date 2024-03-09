import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindr/app/profile/components/user_infor.dart';
import 'package:mindr/app/profile/controller.dart';
import 'package:mindr/auth/login/viewmodal/login_controller.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    UserCredential? user = Provider.of<LoginAuth>(context, listen: false).user;
    print(user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey[100],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const UserInfor(
                title: 'Email',
                value: 'kambulasihle@gmail.com',
              ),
              const SizedBox(
                height: 10,
              ),
              const UserInfor(title: 'Notion login', value: 'false'),
              const SizedBox(
                height: 10,
              ),
              const UserInfor(title: 'Google login', value: 'true'),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  ProfileController().logout();
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Text(
                      'Log out',
                      style: TextStyle(color: Color.fromARGB(255, 3, 118, 212)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
