import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ToolShow extends StatelessWidget {
  const ToolShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('tools').snapshots(),
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
            return Container(
               margin: EdgeInsets.only(top: 20),
              width: 200,
              height: 18,
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(toolDocs[index]['name']),
                  Text(toolDocs[index]['tooltagID'].toString()),
                  Icon(toolDocs[index]['status']
                      ? Icons.offline_pin_outlined
                      : Icons.offline_pin_rounded),
                  Text(toolDocs[index]['status'].toString()),
                ],
              ),
            );
          },
        );
      },
    );
  }
}


class WorkerShow extends StatelessWidget {
  const WorkerShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('workers').snapshots(),
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
            return Container(
              margin: EdgeInsets.only(top: 20),
              width: 200,
              height: 18,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(toolDocs[index]['name']),
                  Text(toolDocs[index]['workertagID'].toString()),
                  Icon(toolDocs[index]['status']
                      ? Icons.offline_pin_outlined
                      : Icons.offline_pin_rounded),
                  Text(toolDocs[index]['status'].toString()),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

