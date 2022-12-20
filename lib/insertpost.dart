import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class insertpost extends StatefulWidget {
  const insertpost({Key? key}) : super(key: key);

  @override
  State<insertpost> createState() => _insertpostState();
}

class _insertpostState extends State<insertpost> {


bool t=false;

  TextEditingController t1= TextEditingController();
  TextEditingController t2= TextEditingController();
  TextEditingController t3= TextEditingController();
  TextEditingController t4= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(controller: t1,),
          TextField(controller: t2,),
          TextField(controller: t3,),
          TextField(controller: t4,),
          ElevatedButton(onPressed: () async {
            String name=t1.text;
            String contact=t2.text;
            String email=t3.text;
            String password=t4.text;
            //https://mayurnda.000webhostapp.com/mayur/insert.php
            var url = Uri.https('mayurnda.000webhostapp.com', 'mayur/insert.php');
            var response = await http.post(url, body: {'name': '$name', 'contact': '$contact','email':'$email','password':'$password'});
            print('Response status: ${response.statusCode}');
            print('Response body: ${response.body}');
            setState(() {
              t=true;
            });

            if(response.body=="data inserted")
              {
                setState(() {
                  t=false;
                });
              }
            else{
              print("data not inserted");
            }
          }, child: Text("Submit")),
          t?Center(child: CircularProgressIndicator(),):Text("")
        ],
      ),
    );
  }
}
