
import 'dart:developer';

import 'package:ecommerceapp/utils/errors/exeptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireAuthService {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exeption FireAuthService.createUserWithEmailAndPassword: ${e.message}');
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'المستخدم موجود بالفعل للبريد الالكتروني');
      }else if (e.code == 'invalid-email') {
        throw CustomException(message: 'البريد الالكتروني غير صالح');
      }
      else if (e.code == 'The email address is already in use by another account')
      {
        throw CustomException(message: 'البريد الالكتروني مستخدم بالفعل');
      }
      else {
        throw CustomException(
            message: 'حدث خطأ، الرجاء المحاولة مرة أخرى');
      }
    } catch (e) {
      log('Exeption FireAuthService.createUserWithEmailAndPassword: ${e.toString()}');
      throw CustomException(message: 'حدث خطأ غير متوقع ، الرجاء المحاولة مرة أخرى');

    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exeption in firebaseAuth FireAuthService.signInWithEmailAndPassword: ${e.message} ..... ${e.code}');
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'البريد الالكتروني او كلمة المرور غير صحيحة');
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'البريد الالكتروني او كلمة المرور غير صحيحة');
      } else if (e.code == 'invalid-credential')
      {
        throw CustomException(message: 'البريد الالكتروني او كلمة المرور غير صحيحة');
      }
      else {
        throw CustomException(
            message: 'حدث خطأ غير متوقع ، الرجاء المحاولة مرة أخرى');
      }
    } catch (e) {
      log('Exeption FireAuthService.signInWithEmailAndPassword: ${e.toString()}');
      throw CustomException(message: 'حدث خطأ غير متوقع ، الرجاء المحاولة مرة أخرى');
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;

  }


  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
  }

}
