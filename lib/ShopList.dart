import 'package:flutter/material.dart';

class ShopList 
{
  bool clicked =false;
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar
      (
        title: Text("Shopping List"),
      ),
      body: Center(
      child:
      ListView.builder( 
        itemBuilder:(context, index) => 
        ListTile(
          leading: Checkbox(
            value: clicked,
            onChanged: (changer)
            {
              clicked = changer;
            }
          ),
          title: Text("Hi"),
        ) ,
        itemCount: 3
        ,)
      ),
    );
  }
}