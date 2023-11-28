import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatelessWidget {
  UpdateScreen({super.key});
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

  TextEditingController studentname = TextEditingController();
  TextEditingController studentclass = TextEditingController();
  TextEditingController studentguardianname = TextEditingController();
  TextEditingController studentaddress = TextEditingController();
  TextEditingController studentphone = TextEditingController();

  void updatestudent(docid){
    final data ={
      'Name':studentname.text,
      'Class':studentclass.text,
      'GuardianName':studentguardianname.text,
      'Address':studentaddress.text,
      'Phone':studentphone.text,
      'Admission_no':selectedAdmissionNumber
    };
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map;
    studentname.text = args['Name'];
    studentclass.text = args['Class'];
    studentguardianname.text = args['Guardian Name'];
    studentaddress.text = args['Address'];
    studentphone.text = args['Phone'];
    selectedAdmissionNumber= args['Admission_no'];
    final docid = args['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text("update students"),
      ),
      body: Padding(
        padding:  const EdgeInsets.all(12.0),
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
              updatestudent(docid);
              Navigator.of(context).pop();
            },
                child:Text('update')),
          ],
        ),
      ),
    );
  }
}
