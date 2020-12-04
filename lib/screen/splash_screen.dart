import 'dart:convert';
import 'dart:io';

import 'package:DOF/screen/home_screen.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String setting = "";
  bool submitted = false;

  getData() async {
    final response =
        await http.post("http://35.225.100.231/god-dof/data_bk.json");
    setState(() {
      submitted = true;
      setting = json.decode(response.body)['data']['settings']['main_page'];
      print(setting);
    });
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
                  margin: const EdgeInsets.only(top: 15),
                  child: WebView(
                    initialUrl: setting,
                    javascriptMode: JavascriptMode.unrestricted,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 400,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: AvatarGlow(
                        child: IconButton(
                          icon: Icon(EvaIcons.gridOutline,
                              size: 30, color: Colors.black),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      home_screen())),
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
            ),
    );
  }
}
