import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_absensi/ui/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyBoXgGbcCMSR6FCA_c9lfDiEbhfxZvPctk',
        appId: '1:190411950815:android:33519fef413d9fd1e9376a',
        messagingSenderId: '190411950815',
        projectId: 'absensi-29aa1'
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Sofia Pro',
        cardTheme: const CardTheme(
          surfaceTintColor: Colors.white,
        ),
        dialogTheme: const DialogTheme(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueAccent
        ),
        useMaterial3: true
      ),
      home: const HomeScreen(),
    );
  }
}

