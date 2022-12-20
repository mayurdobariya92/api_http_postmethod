
import 'dart:convert';

import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


//Api Layer side use
//000webhost creat php file
//convert json to dart



class httppostmethod extends StatefulWidget {
  const httppostmethod({Key? key}) : super(key: key);

  @override
  State<httppostmethod> createState() => _httppostmethodState();
}

class _httppostmethodState extends State<httppostmethod> {


  Map<String, dynamic>?m;
  bool getdata =false;
  mycurrency? mycur;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   get();
  // }
  //
  // void get() async {
  //   try {
  //
  //     //https://mayurnda.000webhostapp.com/currency.php
  //     var url = Uri.https('mayurnda.000webhostapp.com', 'currency.php');
  //     var response = await http.get(url);
  //     print('Response status: ${response.statusCode}');
  //     print('Response body: ${response.body}');
  //
  //     Map<String, dynamic> m=jsonDecode(response.body);
  //     mycur=mycurrency.fromJson(m);
  //
  //     setState(() {
  //       getdata=true;
  //     });
  //
  //     print(m);
  //
  //
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  TextEditingController t3=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: getdata?Column(
        children: [
          TextField(readOnly: true,controller:t1 ,
          onTap: () {
            showCurrencyPicker(
              context: context,
              showFlag: true,
              showCurrencyName: true,
              showCurrencyCode: true,
              onSelect: (Currency currency) {
                t1.text=currency.code;
                print('Select currency: ${currency.name}');
                print('Select currency: ${currency.code}');
              },
            );
          },),
          TextField(controller:t2 ,readOnly: true,
            onTap: () {
              showCurrencyPicker(
                context: context,
                showFlag: true,
                showCurrencyName: true,
                showCurrencyCode: true,
                onSelect: (Currency currency) {
                  t2.text=currency.code;
                  print('Select currency: ${currency.name}');
                  print('Select currency: ${currency.code}');
                },
              );
            },),
          TextField(controller:t3 ,),
          ElevatedButton(onPressed: () async {
            String amount=t3.text;
            String from=t1.text;
            String to= t2.text;

            try {

              //https://mayurnda.000webhostapp.com/currency.php
              var url = Uri.https('mayurnda.000webhostapp.com', 'mayur/currency.php');
              var response = await http.post(url,body: {'amount':amount,'to':to,'from':from});
              print('Response status: ${response.statusCode}');
              print('Response body: ${response.body}');

              Map<String, dynamic> m=jsonDecode(response.body);
              mycur=mycurrency.fromJson(m);

              setState(() {
                getdata=true;
              });

              print(m);


            } catch (e) {
              print(e);
            }
          }, child: Text("submit")),
          Text("${mycur!.result}")
        ],
      ):Center(child: Text("Loading........")),
    );
  }
}


class mycurrency {
  bool? success;
  Query? query;
  Info? info;
  double? result;

  mycurrency({this.success, this.query, this.info, this.result});

  mycurrency.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    query = json['query'] != null ? new Query.fromJson(json['query']) : null;
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.query != null) {
      data['query'] = this.query!.toJson();
    }
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    data['result'] = this.result;
    return data;
  }
}

class Query {
  String? from;
  String? to;
  int? amount;

  Query({this.from, this.to, this.amount});

  Query.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['to'] = this.to;
    data['amount'] = this.amount;
    return data;
  }
}

class Info {
  int? timestamp;
  double? quote;

  Info({this.timestamp, this.quote});

  Info.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    quote = json['quote'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['quote'] = this.quote;
    return data;
  }
}

//header("Access-Control-Allow-Origin: *");