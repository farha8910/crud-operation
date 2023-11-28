import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ScreenAdd extends StatelessWidget {
  ScreenAdd({super.key});

  final AdmissionNumber = [
    '1001',
    '1002',
    '1003',
    '1004',
    '1005',
    '1006',
    '1007',
    '1009',
    '1010',
  ];
  late String selectedAdmissionNumber;
  final CollectionReference student =
  FirebaseFirestore.instance.collection('student');

  void addstudent(){
    final data ={
      'Name':studentname.text,
      'Class':studentclass.text,
      'Guardian name':studentguardianname.text,
      'Address':studentaddress.text,
      'Phone':studentphone.text,
      'Ad,ission_no':selectedAdmissionNumber
    };
    student.add(data);
  }

  TextEditingController studentname = TextEditingController();
  TextEditingController studentclass = TextEditingController();
  TextEditingController studentguardianname = TextEditingController();
  TextEditingController studentaddress = TextEditingController();
  TextEditingController studentphone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add members"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextFormField(
              controller: studentname,
              decoration: InputDecoration(
                labelText: 'username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: studentclass,
              decoration: InputDecoration(
                  labelText: 'userclass',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            TextFormField(
              controller: studentguardianname,
              decoration: InputDecoration(
                  labelText: 'userguardianname',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            TextFormField(
              controller: studentaddress,
              decoration: InputDecoration(
                  labelText: 'useraddress',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            TextFormField(
              controller: studentphone,
              maxLength: 10,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Phone',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                hintText: 'select',
                border: InputBorder.none),
              items: AdmissionNumber.map((e) => DropdownMenuItem(child: Text(e),
              value: e,
              )).toList(),
              onChanged: (val){
                selectedAdmissionNumber=val!;
              }),
            TextButton(onPressed: (){
              addstudent();
              Navigator.of(context).pop();
            },
                child:Text('submit')),
          ],
        ),
      ),
    );
  }
}
