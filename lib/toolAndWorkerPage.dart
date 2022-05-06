import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_bouncy/listComponent/tooltest.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'listComponent/tool_list.dart';
import 'dart:typed_data';
import 'package:get/get.dart';

class ToolAndWorker extends StatefulWidget {
  const ToolAndWorker({Key? key}) : super(key: key);

  @override
  State<ToolAndWorker> createState() => _ToolAndWorkerState();
}

class _ToolAndWorkerState extends State<ToolAndWorker> {
  final controllerToolName = TextEditingController();
  final controllerToolTagID = TextEditingController();

  final controllerWorkerName = TextEditingController();
  final controllerWorkerTagID = TextEditingController();

  void addTool(String toolName) {
    FirebaseFirestore.instance.collection('tools').doc(toolName).set({
      'name': controllerToolName.text,
      'tooltagID': controllerToolTagID.text,
      'status': false
    });
    controllerToolName.clear();
    controllerToolTagID.clear();
  }

  void addWorker(String workerName) {
    FirebaseFirestore.instance.collection('workers').doc(workerName).set({
      'name': controllerWorkerName.text,
      'workertagID': controllerWorkerTagID.text,
      'status': false
    });
    controllerWorkerName.clear();
    controllerWorkerTagID.clear();
  }

  ValueNotifier<dynamic> result = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("공구 사원관리"),
        ),
        body: FutureBuilder<bool>(
            future: NfcManager.instance.isAvailable(),
            builder: (context, snapshot) => snapshot.data != true
                ? Center(
                    child: Text('NfcManager.isAvailable(): ${snapshot.data}'))
                : Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('공구리스트'),
                              Text('사원리스트'),
                            ],
                          ),
                          SizedBox(
                              height: 200,
                              child: Row(
                                children: [
                                  Expanded(child: ToolShow()),
                                  Expanded(child: WorkerShow())
                                ],
                              )),
                          TextField(
                            controller: controllerToolName,
                            decoration: InputDecoration(labelText: '공구이름'),
                          ),
                          TextField(
                            controller: controllerToolTagID,
                            decoration: InputDecoration(labelText: '태그번호'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    addTool(controllerToolName.text);
                                  },
                                  child: Text('공구 추가')),
                              ElevatedButton(
                                  onPressed: () async {
                                    bool statusTest = false;

                                    var docID = controllerToolName.text;

                                    var statusSnapshot = await FirebaseFirestore
                                        .instance
                                        .collection('tools')
                                        .doc(docID)
                                        .get()
                                        .then(
                                      (DocumentSnapshot ds) {
                                        if (ds.exists) {
                                          print('ds exist');
                                          print(ds.data());
                                          statusTest = ds['status'];
                                        } else {
                                          print('this is error ');
                                        }
                                      },
                                    );

                                    print(statusTest);

                                    await FirebaseFirestore.instance
                                        .collection('tools')
                                        .doc(controllerToolName.text)
                                        .update({"status": !statusTest});
                                  },
                                  child: Text('공구 상태변경'))
                            ],
                          ),
                          TextField(
                            controller: controllerWorkerName,
                            decoration: InputDecoration(labelText: '사원이름'),
                          ),
                          TextField(
                            controller: controllerWorkerTagID,
                            decoration: InputDecoration(labelText: '사원번호'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    addWorker(controllerWorkerName.text);
                                  },
                                  child: Text('사원 추가')),
                              ElevatedButton(
                                  onPressed: () async {
                                    bool statusTest = false;

                                    var docID = controllerWorkerName.text;

                                    var statusSnapshot = await FirebaseFirestore
                                        .instance
                                        .collection('workers')
                                        .doc(docID)
                                        .get()
                                        .then(
                                      (DocumentSnapshot ds) {
                                        if (ds.exists) {
                                          print('ds exist');
                                          print(ds.data());
                                          statusTest = ds['status'];
                                        } else {
                                          print('this is error ');
                                        }
                                      },
                                    );

                                    print(statusTest);

                                    await FirebaseFirestore.instance
                                        .collection('workers')
                                        .doc(controllerWorkerName.text)
                                        .update({"status": !statusTest});
                                  },
                                  child: Text('사원 상태변경 ')),
                              //   Container(
                              //     margin: EdgeInsets.all(4),
                              // constraints: BoxConstraints.expand(),
                              // decoration: BoxDecoration(border: Border.all()),
                              // child: SingleChildScrollView(
                              //   child: ValueListenableBuilder<dynamic>(
                              //     valueListenable: result,
                              //     builder: (context, value, _) =>
                              //         Text('${value ?? ''}'),
                              //   ),
                              // ),

                              //   ),
                            ],
                          ),
                          ElevatedButton(
                              child: Text('Tag Read'), onPressed: _tagRead),
                          ElevatedButton(
                              child: Text('NFC 쓰기- 사원'), onPressed: _ndefWrite),
                          ElevatedButton(
                              child: Text('NFC 쓰기 잠금 '),
                              onPressed: _ndefWriteLock),
                        ],
                      ),
                    ),
                  )));
  }

  void _tagRead() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      result.value = tag.data;
      var ndef = Ndef.from(tag);
      if (ndef == null || !ndef.isWritable) {
        result.value = '빈 태그 입니다.';
        NfcManager.instance.stopSession(errorMessage: result.value);
        return;
      }

      NdefRecord record = ndef.cachedMessage!.records.first;
      // var decodedPayload = ascii.decode(record.payload);
      // var payloadlength = record.
      // var decodedPayload = ascii.decode(record.payload);
      // byte[] RTD_TEXT = record.payload;
      // for(int i=0; i<payloadlength; i++){

      // }
      Map<String, dynamic> test = result.value;
      var record0 = test['ndef']['cachedMessage']['records'][0]['payload'];
      var record1 = test['ndef']['cachedMessage']['records'][1]['payload'];
      var haha = record.payload;
      // var midRecord =[];
      // for(var i=3; i<record0.length;i++){
      //   midRecord[i-3]= record0[i];
      // }
      var workerNameNFC = utf8.decode(record0).substring(3);

      var workerTagIDNFC = utf8.decode(record1).substring(3);

      bool statusTest = false;

      var docID = workerNameNFC;



      Get.dialog(AlertDialog(
        title: const Text('Dialog'),
        content: SizedBox(
          height: 300,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('사원이름:'),
                  Text(workerNameNFC),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('사원 태그 번호:'),
                  Text(workerTagIDNFC),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('close'))
        ],
      ));

      var statusSnapshot = await FirebaseFirestore.instance
          .collection('workers')
          .doc(docID)
          .get()
          .then(
        (DocumentSnapshot ds) {
          if (ds.exists) {
            print('ds exist');
            print(ds.data());
            statusTest = ds['status'];
          } else {
            print('this is error ');
            NfcManager.instance.stopSession();
          }
        },
      );
      await FirebaseFirestore.instance
          .collection('workers')
          .doc(docID)
          .update({"status": !statusTest});

      NfcManager.instance.stopSession();
    });
  }

  void _ndefWrite() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null || !ndef.isWritable) {
        result.value = 'Tag is not ndef writable';
        NfcManager.instance.stopSession(errorMessage: result.value);
        return;
      }

      NdefMessage message = NdefMessage([
        NdefRecord.createText(controllerWorkerName.text),
        NdefRecord.createText(controllerWorkerTagID.text),
        // NdefRecord.createUri(Uri.parse('https://flutter.dev')),
        // NdefRecord.createMime(
        //     'text/plain', Uint8List.fromList('Hello'.codeUnits)),
        // NdefRecord.createExternal(
        //     'com.example', 'mytype', Uint8List.fromList('mydata'.codeUnits)),
      ]);

      try {
        await ndef.write(message);
        result.value = 'Success to "Ndef Write"';
        NfcManager.instance.stopSession();
      } catch (e) {
        result.value = e;
        NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }
    });
  }

  void _ndefWriteLock() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null) {
        result.value = 'Tag is not ndef';
        NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }

      try {
        // await ndef.isWritable;
        await ndef.writeLock();
        result.value = 'Success to "Ndef Write Lock"';
        NfcManager.instance.stopSession();
      } catch (e) {
        result.value = e;
        NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }
    });
  }
}
