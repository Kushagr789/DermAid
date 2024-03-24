import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';


class ImageClassificationPage extends StatefulWidget {
  @override
  _ImageClassificationPageState createState() => _ImageClassificationPageState();
}

class _ImageClassificationPageState extends State<ImageClassificationPage> {
  File? _image;
  List<dynamic>? _results;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Load TFLite model
    loadModel();
  }

  // Load the TFLite model
  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: 'assets/Model/cnn_model.tflite',
    );
  }

  // Function to select an image from the gallery
  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _isLoading = true;
        _image = File(pickedImage.path);
      });

      // Perform classification
      classifyImage(_image!);
    }
  }

  // Function to classify the selected image
  Future<void> classifyImage(File image) async {
    var result = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 1,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _isLoading = false;
      _results = result;
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Classification Demo'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : (_image == null
            ? Text('No image selected.')
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(_image!),
            SizedBox(height: 20),
            _results != null
                ? Text(
              'Result: ${_results![0]['label']}',
              style: TextStyle(fontSize: 20),
            )
                : Text('No classification result.'),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _selectImage,
        tooltip: 'Select Image',
        child: Icon(Icons.image),
      ),
    );
  }
}
