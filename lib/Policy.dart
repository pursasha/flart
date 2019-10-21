import 'package:flutter/material.dart';

class Policy
{
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar
      (
        title: Text("Policies"),
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