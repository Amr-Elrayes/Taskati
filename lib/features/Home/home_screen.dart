import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:taskati/features/Home/widgets/Date_Row.dart';
import 'package:taskati/features/Home/widgets/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [HomeHeader(), Gap(50), DateRow()]),
        ),
      ),
    );
  }
}
