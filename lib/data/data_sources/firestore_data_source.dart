import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_progress_model.dart';

class FirestoreDataSource {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  String? get currentUserId => auth.currentUser?.uid;

  DocumentReference<Map<String, dynamic>>? get userProgressDoc {
    String? uid = currentUserId;
    if (uid == null) return null;
    return firestore.collection('users').doc(uid).collection('data').doc('progress');
  }

  Future<UserProgressModel?> fetchUserProgress() async {
    DocumentReference<Map<String, dynamic>>? docRef = userProgressDoc;
    if (docRef == null) return null;

    DocumentSnapshot<Map<String, dynamic>> snapshot = await docRef.get();
    if (snapshot.exists && snapshot.data() != null) {
      return UserProgressModel.fromJson(snapshot.data()!);
    }
    return null;
  }

  Future<void> saveUserProgress(UserProgressModel progress) async {
    DocumentReference<Map<String, dynamic>>? docRef = userProgressDoc;
    if (docRef == null) return;

    await docRef.set(progress.toJson(), SetOptions(merge: true));
  }

  Future<void> resetUserProgress() async {
    DocumentReference<Map<String, dynamic>>? docRef = userProgressDoc;
    if (docRef == null) return;

    await docRef.delete();
  }
}
