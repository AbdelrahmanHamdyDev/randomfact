import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key, required this.UselessFact});

  final String UselessFact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              "assets/cat.webp",
              color: Theme.of(context).colorScheme.onSurface,
              scale: 4,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 6,
              vertical: MediaQuery.of(context).size.height / 3,
            ),
            alignment: Alignment.center,
            child: Text(
              UselessFact,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }
}
