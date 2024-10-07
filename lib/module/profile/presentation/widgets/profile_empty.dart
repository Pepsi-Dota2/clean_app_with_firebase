import 'package:flutter/material.dart';

class ProfileEmpty extends StatelessWidget {
  const ProfileEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "User info is empty",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
