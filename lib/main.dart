import 'package:ab_final_entregable/screens/functions/forum_provider.dart';
import 'package:ab_final_entregable/screens/type_lumina.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ForumProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: "Okizime",
      theme: ThemeData.dark(),
      home: const TypeLumina(),
    );
  }
}
