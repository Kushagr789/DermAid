import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text("Hello"),
            decoration: BoxDecoration(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
