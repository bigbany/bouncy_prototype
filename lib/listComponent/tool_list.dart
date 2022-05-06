import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ToolListShow extends StatelessWidget {
  const ToolListShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('tools')
          // .orderBy('time', descending: true)
          .snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final toolDocs = snapshot.data!.docs;

        return ListView.builder(
          // reverse: true,
          itemCount: toolDocs.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(toolDocs[index]['name']),
                Text(toolDocs[index]['tooltagID'].toString()),
                                Icon(toolDocs[index]['status']? Icons.offline_pin_outlined:  Icons.offline_pin_rounded),
                Text(toolDocs[index]['status'].toString()),
              ],
            );
          },
        );
      },
    );
  }
}

class Messages2 extends StatelessWidget {
  const Messages2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('workers')
          // .orderBy('time', descending: true)
          .snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final workerDocs = snapshot.data!.docs;

        return ListView.builder(
          // reverse: true,
          itemCount: workerDocs.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Text(workerDocs[index]['name']),
                Text(workerDocs[index]['status'].toString()),
                
                Text(workerDocs[index]['tagid'].toString()),
              ],
            );
          },
        );
      },
    );
  }
}

class WorkerListShow extends StatelessWidget {
  const WorkerListShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('workers')
          // .orderBy('time', descending: true)
          .snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final workerDocs = snapshot.data!.docs;

        return ListView.builder(
          // reverse: true,
          itemCount: workerDocs.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(workerDocs[index]['name']),
                Text(workerDocs[index]['workertagID'].toString()),
                Icon(workerDocs[index]['status']? Icons.offline_pin_outlined:  Icons.offline_pin_rounded),
                Text(workerDocs[index]['status'].toString()),
              ],
            );
          },
        );
      },
    );
  }
}
