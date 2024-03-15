// import 'package:demo2/User_list.dart';
import 'package:api/apicode.dart';
import 'package:api/apiuser_list.dart';
import 'package:api/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'database/my_database.dart';

class DataEntry extends StatefulWidget {
  Map<String,dynamic>? map;
  DataEntry(map){
    this.map = map;
  }

  @override
  State<DataEntry> createState() => _DataEntryState();
}

class _DataEntryState extends State<DataEntry> {
  var nameController = TextEditingController();
  void initState(){
    nameController.text=widget.map==null?'':widget.map!["name"].toString();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("add data")),
        body: SafeArea(
          child: Card(
            child: Column(
              children: [
                Container(
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(hintText: "Enter User Name"),
                  ),
                ),
                Center(
                  child: Container(
                    child: ElevatedButton(
                      onPressed: () async {
                        // Insertapi()
                        //     .then((value) => Navigator.of(context).pop(true))
                        //     .then(
                        //   (value) {
                        //     return UserListAPI();
                        //   },
                        // );
                        if(widget.map==null){
                         await Insertapi().then((value) => Navigator.of(context).pop(true));
                        }
                        else{
                         await editUser(widget.map!["id"].toString()).then((value) => Navigator.of(context).pop(true));
                        }
                      },
                      child: Text("Submit"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> insertDB() async {
  //   Map<String, dynamic> map = Map<String,dynamic>();
  //   // map["name"] = nameController.text;
  //   // map["Name"];
  //   // model model= model();
  //   await APICode().InsertUser(map);
  // }
  // Future<int> editUser(id) async {
  //   Map<String, Object?> map = Map<String, Object?>();
  //   map["Name"]=nameController.text;
  //   // map["CityId"]=cityIdController.text;
  //
  //   var res = await MyDatabase().editUser(map, id);
  //   return res;
  // }
 Future<void> Insertapi() async {
    model model1=model();
   // Map<String, dynamic> map = {};

   // map["name"]=nameController.text;
    model1.name =nameController.text;
   Map<String, dynamic> map =model1.convert();

   await APICode().InsertUser(map);
 }
  Future<void> editUser(id) async{
    model model1=model();

    model1.name =nameController.text;
    Map<String, dynamic> map =model1.convert();

    await APICode().editUser(map, id);
    // var response1 = http.put(Uri.parse("https://632158b682f8687273afe9c3.mockapi.io/EmployeeDetails/"+widget.map['id'].toString(),),body: map);
  }
}
