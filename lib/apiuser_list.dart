import 'package:api/Dats_Entry.dart';

import 'apicode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserListAPI extends StatefulWidget {
  const UserListAPI({super.key});

  @override
  State<UserListAPI> createState() => _UserListAPIState();
}

class _UserListAPIState extends State<UserListAPI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.white70,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return DataEntry(null);
                  // return DataEntry(null);
                  // return EnterDetail(Detail: null,);
                },
              ),
            ).then((value){
              if(value==true){
                setState(() {

                });
              }
            } );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(title: Text("data")),
      body: FutureBuilder(
        future: APICode().getdetail(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.teal,
                  child: Row(
                      children: [
                        Expanded(child: Text(snapshot.data![index]["name"],style: TextStyle(color: Colors.white) ,selectionColor: Colors.white,)),
                        IconButton(onPressed: () async {
                          await APICode().deletRecord(snapshot.data![index]["id"]).then((value) {setState(() {});});
                  
                        }, icon: Icon(Icons.delete)),
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return DataEntry(snapshot.data![index]);
                                },
                              )).then((value) {

                                setState(() {

                                });


                              },);
                            },
                            child: Icon(Icons.edit),
                          ),
                        ),
                      ]
                  ),
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
          // return CircularProgressIndicator();
        },
      ),
    );
  }
}
