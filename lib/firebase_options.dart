// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDeE6ErWjxAfMwllu6JU2i7E00VUifuCWk',
    appId: '1:45385186537:web:3e728ab1163d9769e40478',
    messagingSenderId: '45385186537',
    projectId: 'final-project-mobile-93131',
    authDomain: 'final-project-mobile-93131.firebaseapp.com',
    storageBucket: 'final-project-mobile-93131.appspot.com',
    measurementId: 'G-PB65J7MEGJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBi8PGfTFQrlJxcm0TjMCfxCpwl7S8w-HA',
    appId: '1:45385186537:android:82c3638997bb7a2ee40478',
    messagingSenderId: '45385186537',
    projectId: 'final-project-mobile-93131',
    storageBucket: 'final-project-mobile-93131.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgn08kHziOS0oinWgxq31dgRF_NpEQQLs',
    appId: '1:45385186537:ios:f0445503f861ab26e40478',
    messagingSenderId: '45385186537',
    projectId: 'final-project-mobile-93131',
    storageBucket: 'final-project-mobile-93131.appspot.com',
    iosClientId: '45385186537-2hcf1l59j5gh6vg8436b6o7booqle5p2.apps.googleusercontent.com',
    iosBundleId: 'com.example.finalProjectMobile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCgn08kHziOS0oinWgxq31dgRF_NpEQQLs',
    appId: '1:45385186537:ios:f0445503f861ab26e40478',
    messagingSenderId: '45385186537',
    projectId: 'final-project-mobile-93131',
    storageBucket: 'final-project-mobile-93131.appspot.com',
    iosClientId: '45385186537-2hcf1l59j5gh6vg8436b6o7booqle5p2.apps.googleusercontent.com',
    iosBundleId: 'com.example.finalProjectMobile',
  );
}
