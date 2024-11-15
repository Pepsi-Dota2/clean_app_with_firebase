import 'package:flutter/material.dart';

class ProfileFailure extends StatelessWidget {
  final String message;
  const ProfileFailure({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
      ),
    );
  }
}
