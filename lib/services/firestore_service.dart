import 'package:chat_app/const/firebase_const.dart';

class FireStoreServices{

  //get user data
  static getUser(email){
    return firestore.collection(userCollection).where('email', isEqualTo: email).snapshots(); 
    // return firestore.collection("users").doc(email).get();
  }
}
