import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // untuk store data
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // untuk autentifikasi
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> register({
    required String email,
    required String password,
    required String name,
  }) async {
    String res = ' Some error occured';
    try {
      if (email.isNotEmpty && password.isNotEmpty && name.isNotEmpty) {
        // untuk register user di firebase auth dengan email dan password
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        // untuk menambahkan user ke cloud firestore
        await _firestore.collection("users").doc(credential.user!.uid).set({
          'name': name,
          'email': email,
          'uid': credential.user!.uid
        }); // tidak bisa menyimpan password
        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  // fungsi untuk melakukan login
  Future<String> login({
    required String email,
    required String password,
  }) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        // login user dengan email dan password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        // jika sukses akan mengirimkan mengembalikan string 'success'
        res = 'success';
      } else {
        res = 'Please enter email and password';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  // fungsi untuk melakukan sign out
  Future<void> signOut () async {
    await _auth.signOut();
  }

  // funsgi untuk mendapatkan username dari akun yang telah diregistrasi
  Future<String?> getUsername() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection("users").doc(user.uid).get();
      return userDoc['name'] as String? ?? 'Guest';
    }
    return 'Guest';
  }

  // Future<String?> getPhotoUrl() async {
  //   try {
  //     User? user = _auth.currentUser;
  //     if (user != null) {
  //       // Prioritaskan photo URL dari Firebase Auth
  //       if (user.photoURL != null && user.photoURL!.isNotEmpty) {
  //         // Update Firestore dengan photo URL terbaru
  //         await _firestore.collection("users").doc(user.uid).update({
  //           'photoUrl': user.photoURL,
  //         });
  //         return user.photoURL;
  //       }

  //       // Jika tidak ada di Auth, cek di Firestore
  //       DocumentSnapshot userDoc = await _firestore.collection("users").doc(user.uid).get();
  //       if (userDoc.exists) {
  //         Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
  //         return userData['photoUrl'] as String?;
  //       }
  //     }
  //     return null;
  //   } catch (e) {
  //     print('Error getting photo URL: $e');
  //     return null;
  //   }
  // }

  // Future<void> updatePhotoUrl(String photoUrl) async {
  //   try {
  //     User? user = _auth.currentUser;
  //     if (user != null) {
  //       // Update di Firebase Auth
  //       await user.updatePhotoURL(photoUrl);
        
  //       // Update di Firestore
  //       await _firestore.collection("users").doc(user.uid).update({
  //         'photoUrl': photoUrl,
  //       });
  //     }
  //   } catch (e) {
  //     print('Error updating photo URL: $e');
  //   }
  // }

}
