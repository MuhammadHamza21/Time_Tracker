import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              // Firebase.initializeApp();
              try {
                var signIn = await FirebaseAuth.instance.signInAnonymously();
                print(signIn.user!.uid);
              } catch (e) {
                print(e.toString());
              }
            },
            child: const Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
