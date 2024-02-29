import 'package:flutter/material.dart';
import '/features/authentication/domain/entities/user_entity.dart';

class HomePage extends StatelessWidget {
  final UserEntity user;

  HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
    );
  }
}
