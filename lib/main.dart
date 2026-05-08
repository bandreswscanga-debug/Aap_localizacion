import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/wardrobe_provider.dart';
import 'screens/home_screen.dart';
import 'screens/lock_screen.dart';
import 'screens/terminal_screen.dart';
import 'theme/hacker_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WardrobeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        // 🔥 Usamos el tema hacker (de Angie)
        theme: hackerTheme,

        // 🔥 Flujo correcto:
        // Terminal → Lock → Home
        home: const TerminalScreen(),

        routes: {
          '/lock': (context) => const LockScreen(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}