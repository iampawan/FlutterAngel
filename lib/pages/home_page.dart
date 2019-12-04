import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String res;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    // Response response = await Dio().get("http://192.168.0.179:8383");
    Response response = await Dio().post("http://192.168.0.179:8383/createUser",
        data: {"name": "Dart", "age": 20});
    res = response.data;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Angel App"),
      ),
      body: Center(
        child: res == null
            ? CircularProgressIndicator()
            : Text(res?.toString() ?? "No Data"),
      ),
    );
  }
}
