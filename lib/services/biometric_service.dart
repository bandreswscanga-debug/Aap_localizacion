import 'package:local_auth/local_auth.dart';

class BiometricService {
  final LocalAuthentication _auth = LocalAuthentication();

  /// Verifica si el dispositivo soporta biometría
  Future<bool> isBiometricAvailable() async {
    try {
      return await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
    } catch (e) {
      return false;
    }
  }

  /// Obtiene los tipos de biometría disponibles
  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } catch (e) {
      return [];
    }
  }

  /// Ejecuta la autenticación biométrica
  Future<bool> authenticate() async {
    try {
      final bool isAvailable = await isBiometricAvailable();

      if (!isAvailable) return false;

      bool authenticated = await _auth.authenticate(
        localizedReason: 'Por favor autentícate para acceder',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );

      return authenticated;
    } catch (e) {
      return false;
    }
  }
}