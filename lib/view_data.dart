import 'package:encuestas/model/users_model.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class ViewData extends StatefulWidget {
  UserModel userdata;

  ViewData({Key? key, required this.userdata}) : super(key: key);

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  @override
  Widget build(BuildContext context) {
    UserModel data = widget.userdata;
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Data"),
      ),
      body: Text(data.email.toString())//aqui ya se esta mostrando la data
    );
  }
} 
