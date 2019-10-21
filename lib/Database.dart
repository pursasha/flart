import 'package:flutter/material.dart';

class Database
{
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar
      (
        title: Text("Databases"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
              Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}