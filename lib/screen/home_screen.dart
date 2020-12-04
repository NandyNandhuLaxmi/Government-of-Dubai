import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'bawabatech.dart';
import 'bayan.dart';
import 'khazna.dart';
import 'tahiyah.dart';

class home_screen extends StatefulWidget {
  @override
  _home_screenState createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  String data0 = "",
      data1 = "",
      data2 = "",
      data3 = "",
      data4 = "",
      data5 = "",
      link = "";
  bool submitted = false;

  getData() async {
    // try {
    //   String url = 'http://35.225.100.231/god-dof/data.xml';
    //   http.Response response = await http.get(url);
    //   xml2json.parse(response.body);
    //   var jsondata = xml2json.toGData();
    //   var data = json.decode(jsondata);
    //   buildLists(data);
    // } catch (e) {
    //   print(e)
    // }

    try {
      final response =
          await http.get("http://35.225.100.231/god-dof/data_bk.json");
      if (response.statusCode == 200) {
        setState(() {
          data0 = json.decode(response.body)['data']['main_pages'][0]['icon'];
          data1 = json.decode(response.body)['data']['main_pages'][1]['icon'];
          data2 = json.decode(response.body)['data']['main_pages'][2]['icon'];
          data3 = json.decode(response.body)['data']['main_pages'][3]['icon'];
          data4 = json.decode(response.body)['data']['logos'][0]['logo'];
          data5 = json.decode(response.body)['data']['logos'][1]['logo'];
          link = json.decode(response.body)['data']['main_pages'][0]['link'];
        });
        // try {
        //   print("trying");
        //   final response1 = await http.post(link);
        //   print("status code is " + response1.statusCode.toString());
        //   print("link is" + link);
        // } catch (e) {
        //   print("eror is " + e.toString());
        // }

        if (data0 != "" &&
            data1 != "" &&
            data2 != "" &&
            data3 != "" &&
            data4 != "" &&
            data5 != "") {
          setState(() {
            submitted = true;
          });
        }
        print(data0);
        print(data1);
        print(data2);
        print(data3);
        print(data4);
        print(data5);
      } else {
        throw Exception("Error Server");
      }
    } catch (e) {
      throw Exception(e.toString());
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
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Image.network(
          data4,
          height: 43,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              data5,
              height: 20,
            ),
          ),
        ],
      ),
      body: submitted == false
          ? Center(
              child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFFBA996C)),
            ))
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    // height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 210,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFFFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                              image: NetworkImage(data0),
                                            ),
                                            border: Border.all(
                                                color: Color(0xFFBA996C),
                                                width: 2),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(10, 10),
                                                  color: Colors.black45
                                                      .withOpacity(0.35),
                                                  blurRadius: 20.0),
                                              BoxShadow(
                                                  offset: Offset(-10, -10),
                                                  color: Colors.white,
                                                  blurRadius: 20.0),
                                            ]),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                     Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Bayan()));
                                  },
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                GestureDetector(
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 280,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFFFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                              image: NetworkImage(data2),
                                            ),
                                            border: Border.all(
                                                color: Color(0xFFBA996C),
                                                width: 2),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(10, 10),
                                                  color: Colors.black45
                                                      .withOpacity(0.35),
                                                  blurRadius: 20.0),
                                              BoxShadow(
                                                  offset: Offset(-10, -10),
                                                  color: Colors.white,
                                                  blurRadius: 20.0),
                                            ]),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Khazna()));
                                  },
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 280,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFFFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                              image: NetworkImage(data1),
                                            ),
                                            border: Border.all(
                                                color: Color(0xFFBA996C),
                                                width: 2),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(10, 10),
                                                  color: Colors.black45
                                                      .withOpacity(0.35),
                                                  blurRadius: 20.0),
                                              BoxShadow(
                                                  offset: Offset(-10, -10),
                                                  color: Colors.white,
                                                  blurRadius: 20.0),
                                            ]),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Bawabatech()));
                                  },
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                GestureDetector(
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 210,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFFFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                              image: NetworkImage(data3),
                                            ),
                                            border: Border.all(
                                                color: Color(0xFFBA996C),
                                                width: 2),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(10, 10),
                                                  color: Colors.black45
                                                      .withOpacity(0.35),
                                                  blurRadius: 20.0),
                                              BoxShadow(
                                                  offset: Offset(-10, -10),
                                                  color: Colors.white,
                                                  blurRadius: 20.0),
                                            ]),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Tahiyah()));
                                  },
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
