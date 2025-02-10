import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:arther_chat_app/services/auth/auth_gate.dart';
import 'package:arther_chat_app/firebase_options.dart';
import 'package:arther_chat_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load .env variables
  try {
    await dotenv.load(fileName: ".env");
    print("Dotenv initialized: ${dotenv.isInitialized}");
    print("Loaded env variables: ${dotenv.env}");
  } catch (e) {
    print("Error loading .env file: $e");
  }

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}