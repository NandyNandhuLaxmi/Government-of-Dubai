import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

class Khazna extends StatefulWidget {
  @override
  _KhaznaState createState() => _KhaznaState();
}

class _KhaznaState extends State<Khazna> {
  String data0 = "", data1 = "", link = "", setting = "";
  bool submitted = false;

  getData() async {
    try {
      final response =
          await http.post("http://35.225.100.231/god-dof/data_bk.json");

      if (response.statusCode == 200 && response.statusCode < 400) {
        setState(() {
          data0 = json.decode(response.body)['data']['logos'][0]['logo'];
          data1 = json.decode(response.body)['data']['logos'][1]['logo'];
          link = json.decode(response.body)['data']['main_pages'][2]['link'];
          setting = json.decode(response.body)['data']['settings']
              ['maintanance_page'];
        });
        try {
          print("trying");
          final response1 = await http.post(link).timeout(Duration(seconds: 5));
          print("status code is " + response1.statusCode.toString());
          print("link is" + link);
        } catch (e) {
          print("eror is " + e.toString());
          setState(() {
            link = setting;
          });
        }
        if (data0 != "" && data1 != "" && link != "") {
          setState(() {
            submitted = true;
          });
        } else {
          setting = json.decode(response.body)['data']['settings']
              ['maintanance_page'];
        }
        print(data0);
        print(data1);
        print(link);
      } else {
        throw Exception("Error Server");
      }
    } on SocketException {
      print("You are not connected");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        // appBar: AppBar(
        //   backgroundColor: Colors.grey.shade200,
        //   elevation: 0,
        //   automaticallyImplyLeading: false,
        //   centerTitle: true,
        //   title: AvatarGlow(
        //     child: IconButton(
        //       icon: Icon(EvaIcons.homeOutline, color: Colors.black),
        //       onPressed: () => Navigator.pop(
        //         context,
        //       ),
        //     ),
        //     endRadius: 50.0,
        //     duration: Duration(milliseconds: 2000),
        //     repeat: true,
        //     showTwoGlows: true,
        //     glowColor: Color(0xFFBA996C),
        //     repeatPauseDuration: Duration(milliseconds: 100),
        //   ),
        // ),
        body: submitted == false
            ? Center(
                child: CircularProgressIndicator(
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Color(0xFFBA996C)),
                ),
              )
            : Stack(
                children: [
                  Container(
                    color: Colors.grey.shade200,
                    child: WebView(
                      initialUrl: link,
                      javascriptMode: JavascriptMode.unrestricted,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: AvatarGlow(
                          child: IconButton(
                            icon:
                                Icon(EvaIcons.gridOutline, size: 30, color: Colors.white),
                            onPressed: () => Navigator.pop(
                              context,
                            ),
                          ),
                          endRadius: 50.0,
                          duration: Duration(milliseconds: 2000),
                          repeat: true,
                          showTwoGlows: true,
                          glowColor: Color(0xFFBA996C),
                          repeatPauseDuration: Duration(milliseconds: 100),
                        ),
                      ),
                    ],
                  )
                ],
              ));
  }
}
