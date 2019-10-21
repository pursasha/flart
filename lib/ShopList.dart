import 'package:flutter/material.dart';

class ShopList
{
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar
      (
        title: Text("Shopping List"),
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