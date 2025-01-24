import 'package:flutter/material.dart';
import 'package:randomfact/controller.dart';
import 'package:randomfact/view/widget/main_widget.dart';

class homeScreen extends StatefulWidget {
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  void initState() {
    super.initState();
    toDo_First();
  }

  @override
  void dispose() {
    super.dispose();
    factStreamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: factStreamController.stream,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return MainWidget(uselessFact: snapshot.data!);
        },
      ),
    );
  }
}
