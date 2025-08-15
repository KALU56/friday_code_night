import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/models/auth.dart';

class AuthData {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserEmailModel> login(String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final doc = await _firestore.collection('user').doc(cred.user?.uid).get();

      if (!doc.exists) {
        throw Exception('User document not found');
      }

      return UserEmailModel.fromJson(doc.data()!, doc.id);
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found with this email';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email format';
          break;
        default:
          errorMessage = 'Login failed: ${e.message}';
      }
      throw Exception(errorMessage);
    }
  }

  Future<void> signUp(
    String email,String password,String userName,String phone,
  ) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userModel = UserEmailModel(
        id: cred.user!.uid,
        email: email,
        userName: userName,
        phone: phone,
      );

      await saveUserToFirestore(userModel);
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = 'Email is already in use';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email format';
          break;
        case 'weak-password':
          errorMessage = 'Password is too weak';
          break;
        default:
          errorMessage = 'Sign up failed: ${e.message}';
      }
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('Sign up failed: ${e.toString()}');
    }
  }


  Future<void> saveUserToFirestore(UserEmailModel user) async {
    await _firestore
        .collection('user') 
        .doc(user.id)
        .set(user.toJson());
  }
}
