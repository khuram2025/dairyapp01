import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app01/model/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String? _dropDownText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 4.0,
        backgroundColor: Colors.grey.shade100,
        title: Row(
          children: [
            Text(
              "Dairy",
              style: TextStyle(
                  fontSize: 39,
                  color: Colors.grey.shade400
              ),
            ),
            Text(
              "Book",
              style: TextStyle(
                  fontSize: 39,
                  color: Colors.green
              ),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(items: <String>[
                  "Latest", "Earliest"
                ].map((String value) {
                  return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                    value, style: TextStyle(
                        color: Colors.grey
                      ),
                  ));
                }).toList(),
                  hint: (_dropDownText == null) ? Text('Select') : Text(_dropDownText!),
                  onChanged: (value){
                  if ( value == 'Latest') {
                    setState(() {
                      _dropDownText = value;
                    });
                  } else if (value == 'Earliest'){
                    setState(() {
                      _dropDownText = value;
                    });
                  }
                  },
                ),

              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('users').snapshots(),

                  builder: (context, snapshot) {
                    if (snapshot.connectionState ==ConnectionState.waiting) {
                      return CircularProgressIndicator();

                    }
                    final usersListStream = snapshot.data!.docs.map((docs) {
                      return MUser.fromDocument(docs);
                    }).where((muser) {
                      return (muser.uid == FirebaseAuth.instance.currentUser!.uid);
                    }).toList();

                    MUser curUser = usersListStream[0];


                    return Container(
                    child: Row(
                    children: [
                    Column(
                    children: [
                    Expanded(child: InkWell(
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                    "https://picsum.photos/200/300",
                    ),
                    backgroundColor: Colors.transparent,
                    ),
                    ),
                    )),
                    Text(curUser.dsiplayName!, style: TextStyle(
                    color: Colors.grey
                    ),)
                    ],
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.logout_outlined, size: 19, color: Colors.redAccent,))
                    ],
                    ),
                    );

              }),

            ],
          )
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
              child: Container(

                height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
              shape: BoxShape.rectangle,
              border: Border(
                right: BorderSide(width: 0.4),
              )
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(38.0),
                  child: SfDateRangePicker(
                    onSelectionChanged: (dateRangePickerSelection){
                      print(dateRangePickerSelection.value.toString());
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(48.0),
                  child: Card(
                    elevation: 4,
                    child: TextButton.icon(onPressed: (){},
                        icon: Icon(Icons.add, size: 40, color: Colors.greenAccent,),
                        label: Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Write New", style: TextStyle(
                              fontSize: 17
                            ) ,),
                          ),
                        )),

                  ),
                )
              ],
            ),
          )),
          Expanded(
            flex: 3,
              child: Container(
                child: Column(
                  children: [
                    Expanded(child: Container(
                      child: Column(
                        children: [
                          Expanded(child:
                          ListView.builder(
                            itemCount:5,
                            itemBuilder: (context, index) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width*0.4,
                              child: Card(
                                elevation: 4,
                                child: ListTile(
                                  title: Text("Hello Page"),
                                ),
                              ),
                            );
                          },))
                        ],
                      ),
                    ))
                  ],
                ),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: "Add",
        child: Icon(Icons.add),
      ),
    );
  }
}