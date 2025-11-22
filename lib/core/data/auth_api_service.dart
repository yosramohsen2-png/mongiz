import 'package:firebase_auth/firebase_auth.dart';

class AuthApiService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // ------------------------------------
  // Sign Up with Firebase
  // ------------------------------------
  Future<User?> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      // Throw a clean error message based on Firebase error codes
      if (e.code == 'weak-password') {
        throw Exception('كلمة المرور ضعيفة جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('البريد الإلكتروني مسجل بالفعل.');
      } else if (e.code == 'invalid-email') {
        throw Exception('البريد الإلكتروني غير صالح.');
      } else {
        throw Exception(e.message ?? 'حدث خطأ أثناء التسجيل.');
      }
    } catch (e) {
      throw Exception('حدث خطأ غير متوقع: $e');
    }
  }

  // ------------------------------------
  // Sign In with Firebase
  // ------------------------------------
  Future<User?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      // Throw a clean error message
      if (e.code == 'user-not-found') {
        throw Exception('لا يوجد حساب بهذا البريد الإلكتروني.');
      } else if (e.code == 'wrong-password') {
        throw Exception('كلمة المرور غير صحيحة.');
      } else if (e.code == 'invalid-credential') {
        throw Exception('بيانات الدخول غير صحيحة.');
      } else {
        throw Exception(e.message ?? 'حدث خطأ أثناء تسجيل الدخول.');
      }
    } catch (e) {
      throw Exception('حدث خطأ غير متوقع: $e');
    }
  }

  // ------------------------------------
  // Sign Out
  // ------------------------------------
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
  
  // ------------------------------------
  // Get Current User
  // ------------------------------------
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}
