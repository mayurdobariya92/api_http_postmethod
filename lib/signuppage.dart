import 'dart:convert';

import 'package:api_http_postmethod/home.dart';
import 'package:api_http_postmethod/loginpage.dart';
import 'package:api_http_postmethod/viewpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class signuppage extends StatefulWidget {

  Myclass? m;
  String? method;

  signuppage({this.m, this.method});

  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {
  @override
  void initState() {
    super.initState();
    if (widget.method == "update") {
      t1.text = widget.m!.name!;
      t2.text = widget.m!.contact!;
      t3.text = widget.m!.email!;
      t4.text = widget.m!.password!;

    }
  }

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  TextEditingController t4 = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Color(0xfffe987b),
                        Color(0xccfe987b),
                        Color(0x99fe987b),
                        Color(0x66fe987b),
                      ])),
                  child: SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign Up !",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Name(),
                        SizedBox(
                          height: 10,
                        ),
                        Email(),
                        SizedBox(
                          height: 10,
                        ),
                        Contact(),
                        SizedBox(
                          height: 10,
                        ),
                        Password(),
                        SizedBox(
                          height: 20,
                        ),
                        Signupbtn(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )),
        onWillPop: backbtn);
  }

  Future<bool> backbtn() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return loginpage();
      },
    ));
    return Future.value();
  }

  Widget Name() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Name",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: t1,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.account_box_rounded,
                  color: Color(0xfffe987b),
                ),
                hintText: 'Name',
                helperStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget Email() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: t2,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xfffe987b),
                ),
                hintText: 'Email',
                helperStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget Contact() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contact",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: t3,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.call,
                  color: Color(0xfffe987b),
                ),
                hintText: 'Contact',
                helperStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget Password() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: t4,
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xfffe987b),
                ),
                hintText: 'Password',
                helperStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget Signupbtn() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
          ]),
      height: 40,
      child: InkWell(
        onTap: () async {
          String name = t1.text;
          String email = t2.text;
          String contact = t3.text;
          String password = t4.text;

          ///////login email password /////

          var url = Uri.https('mayurnda.000webhostapp.com', 'mayur/login.php');
          var response = await http
              .post(url, body: {'email': '$email', 'password': '$password'});
          print('Response status: ${response.statusCode}');
          print('Response body: ${response.body}');

          List list=jsonDecode(response.body);
          if(list.length==0)
            {
              print("username or password invalid");
            }
          else
            { 
            }


          ///////insert-update/////

          if (widget.method == "insert") {
            var url =
                Uri.https('mayurnda.000webhostapp.com', 'mayur/insert.php');
            var response = await http.post(url, body: {
              'name': '$name',
              'contact': '$contact',
              'email': '$email',
              'password': '$password'
            });
            print('Response status: ${response.statusCode}');
            print('Response body: ${response.body}');

            if (response.body == "data inserted") {
              print("Data Inserted");
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return viewpage();
                },
              ));
            } else {
              print("Data Not Inserted");
            }
          } else {
            var url =
                Uri.https('mayurnda.000webhostapp.com', 'mayur/update.php');
            var response = await http.post(url, body: {
              'name': '$name',
              'contact': '$contact',
              'email': '$email',
              'password': '$password',
              'id': '${widget.m!.id!}'
            });
            print('Response status: ${response.statusCode}');
            print('Response body: ${response.body}');

            if (response.body == "data updated") {
              print("Data Updated");
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return viewpage();
                },
              ));
            } else {
              print("Data Not updated");
            }
          }
        },
        child: Center(
            child: Text(
          "Sign Up/${widget.method}",
          style: TextStyle(
              fontSize: 18,
              color: Color(0xfffe987b),
              fontWeight: FontWeight.bold),
        )),
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

