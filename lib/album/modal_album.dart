// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
//
// class AddBookModel extends ChangeNotifier {
//   String bookTitle = '';
//   File imageFile;
//   bool isLoading = false;
//
//   startLoading() {
//     isLoading = true;
//     notifyListeners();
//   }
//
//   endLoading() {
//     isLoading = false;
//     notifyListeners();
//   }
//
//   Future addBookToFirebase() async {
//     if (bookTitle.isEmpty) {
//       throw ('タイトルを入力してください');
//     }
//     final imageURL = await _uploadImageFile();
//
//     FirebaseFirestore.instance.collection('album').add(
//       {
//         'title': bookTitle,
//         'imageURL': imageURL,
//         'createdAt': Timestamp.now(),
//       },
//     );
//   }
//
//   setImage(File imageFile) {
//     this.imageFile = imageFile;
//     notifyListeners();
//   }
//
//   Future<String> _uploadImageFile() async {
//     if (imageFile == null) {
//       return '';
//     }
//     final storage = FirebaseStorage.instance;
//     final ref = storage.ref().child('books').child(bookTitle);
//     final snapshot = await ref
//         .putFile(
//       imageFile,
//     )
//         .onComplete;
//     final downloadURL = await snapshot.ref.getDownloadURL();
//     return downloadURL;
//   }
//
//   Future updateBook(Album book) async {
//     final imageURL = await _uploadImageFile();
//     final document =
//     FirebaseFirestore.instance.collection('books').document(book.documentID);
//     await document.updateData(
//       {
//         'title': bookTitle,
//         'imageURL': imageURL,
//         'updateAt': Timestamp.now(),
//       },
//     );
//   }
//
//   Future addBook(AddBookModel model, BuildContext context) async {
//     try {
//       await model.addBookToFirebase();
//       await showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('保存しました！'),
//             actions: <Widget>[
//               FlatButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//       Navigator.of(context).pop();
//     } catch (e) {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text(e.toString()),
//             actions: <Widget>[
//               FlatButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }
//
//   Future updateBook(AddBookModel model, BuildContext context) async {
//     try {
//       await model.updateBook(book);
//       await showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('更新しました！'),
//             actions: <Widget>[
//               FlatButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//       Navigator.of(context).pop();
//     } catch (e) {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text(e.toString()),
//             actions: <Widget>[
//               FlatButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }
// }