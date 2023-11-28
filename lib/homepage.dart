import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
   ScreenHome({super.key});
  final CollectionReference student=
      FirebaseFirestore.instance.collection('student');
  void deletestudent(id) {
    student.doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Registration form'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('Screenadd');
        },
        child: Icon(Icons.add),
      ),
      body: StreamBuilder(
        builder: (context,AsyncSnapshot snapshot){
          if(snapshot.hasData) {
            return ListView.builder(itemBuilder: (context,Index) {
              final DocumentSnapshot studentSnap = snapshot.data.docs[Index];
              return Padding(padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white70,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 210, 209, 209),
                            blurRadius: 10,
                            spreadRadius: 8),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 30,
                            child: Text(
                              studentSnap['Admission_no'].toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(studentSnap['Name'],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Text(studentSnap['Class'].toString(),
                            style: TextStyle(fontSize: 16),),
                          Text(studentSnap['Guardian name'],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),),
                          Text(studentSnap['Address'],
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),),
                          Text(studentSnap['Phone'].toString(),
                            style: TextStyle(fontSize: 16),),
                        ],
                      ),
                      Row(
                        children: [IconButton(onPressed: () {
                          Navigator.of(context).pushNamed('update', arguments: {
                            'Name': studentSnap['Name'],
                            'Class': studentSnap['Class'].toString(),
                            'Guardian name': studentSnap['Guardian name'],
                            'Address': studentSnap['Address'],
                            'Phone': studentSnap['Phone'].toString(),
                          });
                        }, icon: Icon(Icons.edit)),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(onPressed: () {
                            deletestudent(studentSnap.id);
                          },
                              icon: Icon(Icons.delete),
                              color: Colors.red)
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
              itemCount: snapshot.data?.docs.length,
            );
          }
          return Container();
        },
        stream: student.orderBy('Name',descending: true).snapshots(),
      ),
    );
  }
}
