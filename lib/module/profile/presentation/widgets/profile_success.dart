import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileSuccess extends StatelessWidget {
  final User? user;
  const ProfileSuccess({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Email : ${user?.email ?? "No Email"}"),
            Text("User Name : ${user?.displayName ?? "No name"}"),
          ],
        ),
      ),
    );
  }
}
