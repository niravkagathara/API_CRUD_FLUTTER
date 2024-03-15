import 'dart:convert';

import 'package:http/http.dart' as http;

class APICode{
    Future<List> getdetail() async {
      var res= await http.get(Uri.parse("https://64e8603a99cf45b15fdf77ff.mockapi.io/faculty"));
      List userList= jsonDecode(res.body);
      return userList;
    }
    Future<void> deletRecord(String id) async {
      var res= await http.delete(Uri.parse("https://64e8603a99cf45b15fdf77ff.mockapi.io/faculty/"+id));

    }

    Future<void> InsertUser(Map<String,dynamic> map) async{
     await http.post(Uri.parse("https://64e8603a99cf45b15fdf77ff.mockapi.io/faculty"),body: map);
    }
    Future<void> editUser(Map<String,dynamic> map,String id)async{
    await http.put(Uri.parse("https://64e8603a99cf45b15fdf77ff.mockapi.io/faculty/"+id),body: map);
    // var response1 = http.put(Uri.parse("https://632158b682f8687273afe9c3.mockapi.io/EmployeeDetails/"+widget.map['id'].toString(),),body: map);

    }
}