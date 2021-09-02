import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/get_started.dart';
// import 'screens/main_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diary Book',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.green,
      ),
      home: GetStartedPage(),
    );
  }
}

class GetInfo extends StatelessWidget {
  const GetInfo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('diaries').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading');
          }
          return new ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              return new ListTile(
                title: Text(document.get('display')),
                subtitle: Text(document.get('profession')),
                );
            }).toList(),
          );
        },
      ),
    );

  }
}

