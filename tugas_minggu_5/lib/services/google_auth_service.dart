
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signInWithGoogle() async {
    try {
      // Sign in dengan Google
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
          
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
            
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        // Dapatkan credentials
        UserCredential userCredential = await auth.signInWithCredential(authCredential);
        User? user = userCredential.user;

        if (user != null) {
          await _firestore.collection('users').doc(user.uid).set({
            'name': user.displayName,
            'email': user.email,
            'photoUrl': user.photoURL, 
            'uid': user.uid,
          }, SetOptions(merge: true));

          // Debug print
          print('Google Sign In Success');
          print('User Photo URL: ${user.photoURL}');
          print('User Name: ${user.displayName}');
          print('User Email: ${user.email}');
        }
      }
    } on FirebaseAuthException catch (e) {
      print('Google Sign In Error: ${e.toString()}');
    }
  }
}