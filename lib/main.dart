import 'package:ab_final_entregable/screens/functions/forum_provider.dart';
import 'package:ab_final_entregable/screens/type_lumina.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      //wrapear la app en un provider
      providers: [
        ChangeNotifierProvider(create: (_) => ForumProvider()),
      ],
      //clase tipo provider que permite la escucha y registro de la app
      //create define la instancia que se va a usar
      //(_) es el contexto, en este caso no se utiliza.
      //ChangeNotifierProvider define la instancia ForumProvider sin un contexto.
      child: const MyApp(),
      //wrapear MyApp en el provider para evitar casting redundante
      //se crea un contexto global de ForumProvider para acceder a esa instancia.
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
