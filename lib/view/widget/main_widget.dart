import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key, required this.uselessFact});

  final String uselessFact;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
          child: SingleChildScrollView(
            child: Text(
              uselessFact,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
      ],
    );
  }
}
