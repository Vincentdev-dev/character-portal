import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students_portal/screens/create/create.dart';
import 'package:students_portal/screens/home/home.dart';
import 'package:students_portal/services/character_store.dart';
import 'package:students_portal/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp( ChangeNotifierProvider(
    create: (context) => CharacterStore (),
    child: MaterialApp(
      theme: primaryTheme,
      home: const Home(),
    ),
  ));
 }

 class SandBox extends StatelessWidget {
  const SandBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SandBox"),
        centerTitle: true,
      ),
      body: const Text("SandBox"),
    );
  }
}