
# DermAid

DermAid is a comprehensive skin disease detection app leveraging deep learning technology. It offers accurate diagnosis, online consultations with dermatologists, and medication reminders. DermAid empowers individuals to proactively address skin health concerns conveniently from the comfort of their devices.


## Features of the application


- **Skin Disease Detection:**
  - Advanced deep learning algorithms are utlized for accurate detection and classification of various skin diseases.
  - Output is in the form of a comparative analysis emphasizing the symptoms and severity of the detected condition. 
- **Diagnosis:**
  - Provides users with detailed diagnosis reports generated through deep analysis of uploaded images. 
- **Consultation:**
  - Offers seamless access to online consultation services, connecting users with certified dermatologists for personalized advice and treatment recommendations.
- **Medication Reminders:**
  - Personalized reminders for taking prescribed medications or following specific treatment regimens, ensuring adherence to their skincare routines.
- **Reports Analysis:**
  - Comprehensive analysis of users' skin health through detailed reports generated based on historical data and diagnostic outcomes. 

## Getting Started

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Steps to Run the Project
![Sample Image](https://camo.githubusercontent.com/48527564837866a4cbd547575a91db55a9699fbe1404c73bc1e39941c7c582dc/68747470733a2f2f692e7974696d672e636f6d2f76692f68667a5f417261546b5f6b2f68713732302e6a70673f7371703d2d6f61796d774568434b344645494944534672797134717041784d4941525541414141414741456c41414449516a3041674b4a442672733d414f6e34434c4162726b4f50537633686a6c32706150476456704444747a7a707451)
- Install any IDE like Visual Studio Code or Android Studio. [Install Android Studio](https://developer.android.com/studio/install) [Install Visual Studio Code.](https://code.visualstudio.com/download)
- Set up the Flutter environment in the preferred IDE (I preferred Android Studio). Checkout the [link](https://docs.flutter.dev/tools/android-studio) for setting up the flutter environment.
- Set up the device to view the application either in Emulator or physical device.
  - To view application using Emulator, Follow the [link](https://developer.android.com/studio/run/emulator).
  - To view application in physical device/ mobile phone, Follow the [link](https://stackoverflow.com/questions/54444538/how-do-i-run-test-my-flutter-app-on-a-real-device)
- Once done with the set-up, clone the project in your local systems using the [link](https://github.com/Kushagr789/DermAid).
- Go to pubspec.yaml and click on 'pub-get' (to fetch all the dependencies).
- Run the project by clicking on the Run button.
- Finally, you are all set to use the application!


## Tech Stack

**Client:** Flutter, Dart

**Server:** Firebase, Firestore

**AI Model:** Tensorflow, Python


## Dependencies Used
- **cupertino_icons:**
  - This is an asset repo containing the default set of icon assets used by Flutter's Cupertino widgets.
  - Check out its usage at https://pub.dev/packages/cupertino_icons.
- **tflite:**
  - This a flutter plugin for accessing TensorFlow Lite. It is used to deploy ML model. Supports both iOS and Android.
  - Check out its usage at https://pub.dev/packages/tflite.
- **camera:**
  - A Flutter plugin for controlling the camera. Supports previewing the camera feed, capturing images and video, and streaming image buffers to Dart.
  - Check out its usage at https://pub.dev/packages/camera.
- **firebase_auth:**
  - This is Flutter plugin for Firebase Auth, enabling authentication using passwords, phone numbers and identity providers like Google, Facebook and Twitter.
  - Check out its usage at https://pub.dev/packages/firebase_auth.
- **cloud_firestore:**
  - Flutter plugin for Cloud Firestore, a cloud-hosted, noSQL database with live synchronization and offline support on Android and iOS.
  - Check out its usage at https://pub.dev/packages/cloud_firestore.
- **shared_preferences:**
  - A Flutter plugin for reading and writing simple key-value pairs. Wraps NSUserDefaults on iOS and SharedPreferences on Android.
  - Check out its usage at https://pub.dev/packages/shared_preferences.
