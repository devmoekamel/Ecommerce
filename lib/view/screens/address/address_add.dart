import 'package:flutter/material.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Add New Adress"),
        centerTitle: true,
      ),
      body: Center(child: Text("AddressAdd "),),
    );
  }
}