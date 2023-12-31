import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({super.key,required this.picture});
  final XFile picture;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Preview Page"),),
    body: Center(
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.file(File(picture.path),fit: BoxFit.cover,width: 250,),
    const SizedBox(height: 24,),
    Text(picture.name)
    ],
    ),
    ),
    );
  }
}
