import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../constants/firebase_constants.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../domain/usecases/auth_register.dart';

abstract class AuthRemoteDatasource {
  Future register(RegisterParams registerParams);
  Future googleAuth();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  @override
  Future googleAuth() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await auth.signInWithCredential(credential);
      return auth.currentUser;
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future register(
    RegisterParams registerParams,
  ) async {
    try {
      final authResult = await auth.createUserWithEmailAndPassword(
        email: registerParams.email,
        password: registerParams.password,
      );
      return authResult.user;
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message);
    }
  }
}
