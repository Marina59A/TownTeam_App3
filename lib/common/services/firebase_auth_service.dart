import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:townteam_app/common/errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String confirmPassword}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (password != confirmPassword) {
        throw CustomException(message: 'password not equal confirmPassword');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'The account already exists for that email.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'Make sure you are connected to the internet.');
      } else {
        throw CustomException(
            message: 'An error occured. Please try again later.');
      }
    } catch (e) {
      log('Exception in firebaseAuthService.createUserWithEmailAndPassword:${e.toString()}');
      throw CustomException(
          message: 'An error occured. Please try again later.');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'Wrong password provided for that user.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'Make sure you are connected to the internet.');
      } else {
        throw CustomException(
            message: 'An error occured. Please try again later.');
      }
    } catch (e) {
      log('Exception in firebaseAuthService.signInWithEmailAndPassword:${e.toString()}');
      throw CustomException(
          message: 'An error occured. Please try again later.');
    }
  }
}
