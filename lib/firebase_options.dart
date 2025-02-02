// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA_YC11I0F2YPU4Rjj8eNbd7JifpZGaqK8',
    appId: '1:440998031664:web:ff5fa00be619e2051018f5',
    messagingSenderId: '440998031664',
    projectId: 'e-comerce-eb562',
    authDomain: 'e-comerce-eb562.firebaseapp.com',
    storageBucket: 'e-comerce-eb562.appspot.com',
    measurementId: 'G-F57DNRZ5PH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyArEggw_Cnq4rhcmtuBqWa26OCC6gcprbQ',
    appId: '1:440998031664:android:c43680a23a8c0ca71018f5',
    messagingSenderId: '440998031664',
    projectId: 'e-comerce-eb562',
    storageBucket: 'e-comerce-eb562.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCPC-c344rMlLYhEi1hAjm1YLuxdQSjtww',
    appId: '1:440998031664:ios:d3adce38ab1d0ce21018f5',
    messagingSenderId: '440998031664',
    projectId: 'e-comerce-eb562',
    storageBucket: 'e-comerce-eb562.appspot.com',
    iosBundleId: 'com.example.ecommerceapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCPC-c344rMlLYhEi1hAjm1YLuxdQSjtww',
    appId: '1:440998031664:ios:d3adce38ab1d0ce21018f5',
    messagingSenderId: '440998031664',
    projectId: 'e-comerce-eb562',
    storageBucket: 'e-comerce-eb562.appspot.com',
    iosBundleId: 'com.example.ecommerceapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA_YC11I0F2YPU4Rjj8eNbd7JifpZGaqK8',
    appId: '1:440998031664:web:3d89f5a09e83d2581018f5',
    messagingSenderId: '440998031664',
    projectId: 'e-comerce-eb562',
    authDomain: 'e-comerce-eb562.firebaseapp.com',
    storageBucket: 'e-comerce-eb562.appspot.com',
    measurementId: 'G-82S3PQKM8V',
  );
}
