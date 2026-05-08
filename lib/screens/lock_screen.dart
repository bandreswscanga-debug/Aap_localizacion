import 'package:flutter/material.dart';
import '../services/biometric_service.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  final BiometricService _biometricService = BiometricService();

  String status = "🔒 Bloqueado";

  @override
  void initState() {
    super.initState();
    authenticateUser();
  }

  Future<void> authenticateUser() async {
    bool success = await _biometricService.authenticate();

    if (success) {
      setState(() {
        status = "✅ Acceso concedido";
      });

      // Redirige al home
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacementNamed(context, '/home');
      });
    } else {
      setState(() {
        status = "❌ Acceso denegado";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Icon(
              Icons.lock,
              size: 80,
              color: Colors.green,
            ),

            const SizedBox(height: 20),

            Text(
              status,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: authenticateUser,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text("Intentar de nuevo"),
            ),
          ],
        ),
      ),
    );
  }
}