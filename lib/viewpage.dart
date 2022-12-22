import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//// lecture thi bnavel file////

class viewpage extends StatefulWidget {
  const viewpage({Key? key}) : super(key: key);

  @override
  State<viewpage> createState() => _viewpageState();
}

class _viewpageState extends State<viewpage> {



  Future viewdata() async {
    var url = Uri.https('mayurnda.000webhostapp.com', 'mayur/veiw.php');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List list = jsonDecode(response.body);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("view"),
      ),
      body: FutureBuilder(
        future: viewdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List list = snapshot.data as List;
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  Myclass m = Myclass.fromJson(list[index]);
                  return ListTile(
                    leading: Text("${m.id}"),
                    title: Text("${m.name}"),
                    subtitle: Text("${m.email}"),
                      trailing: IconButton(onPressed: () async {                          ///////viewdata delete code///
                      var url = Uri.https('mayurnda.000webhostapp.com', 'mayur/delete.php');
                      var response = await http.post(url,body:{'id':'${m.id}'});
                      print('Response status: ${response.statusCode}');
                      print('Response body: ${response.body}');

                      if(response.body=="data deleted"){
                        print("data deteted");
                        setState(() {

                        });
                      }
                      else{
                        print("Data Not Deleted try again!");
                      }

                    }, icon: Icon(Icons.delete))
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class Myclass {
  String? id;
  String? name;
  String? email;
  String? contact;
  String? password;

  Myclass({this.id, this.name, this.email, this.contact, this.password});

  Myclass.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    contact = json['contact'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['contact'] = this.contact;
    data['password'] = this.password;
    return data;
  }
}
