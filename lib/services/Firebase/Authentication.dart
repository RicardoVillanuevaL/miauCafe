import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationServices {
  final FirebaseAuth _firebaseAuth;
  AuthenticationServices(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> cerrarSesion() async {
    await _firebaseAuth.signOut();
  }

  Future<String> logeoUsuario(String email, String pass) async {
    //SING IN
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: pass);
      return "ingreso";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> registroUsuario(String email, String pass) async {
    //SING UP
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: pass);
      return "registro";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
