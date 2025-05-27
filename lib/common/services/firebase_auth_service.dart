import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:townteam_app/common/errors/exceptions.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      if (password != confirmPassword) {
        throw CustomException(message: 'Passwords do not match');
      }

      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      if (credential.user == null) {
        throw CustomException(message: 'Failed to create user account');
      }

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          throw CustomException(message: 'The password provided is too weak.');
        case 'email-already-in-use':
          throw CustomException(
              message: 'The account already exists for that email.');
        case 'invalid-email':
          throw CustomException(message: 'The email address is not valid.');
        case 'network-request-failed':
          throw CustomException(
              message: 'Please check your internet connection.');
        default:
          throw CustomException(
              message: 'An error occurred. Please try again later.');
      }
    } catch (e) {
      log('Exception in firebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}');
      throw CustomException(
          message: 'An error occurred. Please try again later.');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      if (credential.user == null) {
        throw CustomException(message: 'Failed to sign in');
      }

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw CustomException(message: 'No user found for that email.');
        case 'wrong-password':
          throw CustomException(
              message: 'Wrong password provided for that user.');
        case 'invalid-email':
          throw CustomException(message: 'The email address is not valid.');
        case 'network-request-failed':
          throw CustomException(
              message: 'Please check your internet connection.');
        default:
          throw CustomException(
              message: 'An error occurred. Please try again later.');
      }
    } catch (e) {
      log('Exception in firebaseAuthService.signInWithEmailAndPassword: ${e.toString()}');
      throw CustomException(
          message: 'An error occurred. Please try again later.');
    }
  }
}
