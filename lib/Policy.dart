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
      body: Column(
        children: <Widget> [
          RaisedButton(
          onPressed: () {
              Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
        Table(
          border: TableBorder.all(width:1, color: Colors.black),
          defaultVerticalAlignment: TableCellVerticalAlignment.top,
          children:<TableRow>[
            //Heading
            TableRow(
            // decoration: BoxDecoration( border: Border.all(width: 1, color: Colors.black) ),
              children:<Widget>[
                FittedBox(
                  fit:BoxFit.contain,
                  child: Container( 
                    margin:EdgeInsets.all(1),
                   // color:Colors.grey,
                    width: 5.0,
                    height:2.0,
                    child:Center(
                      child:Text("hi there",
                      textAlign: TextAlign.center,
                        style: TextStyle(
                        color: Colors.black, fontSize: 1.0,)
                      ),
                    ),
                    )
                  ),
                FittedBox(
                  fit:BoxFit.contain,
                  child: Container( 
                    margin:EdgeInsets.all(1),
                   // color:Colors.grey,
                    width: 5.0,
                    height:2.0,
                    child:Center(
                      child:Text("blah",
                      textAlign: TextAlign.center,
                        style: TextStyle(
                        color: Colors.black, fontSize: 1.0,)
                      ),
                    ),
                    )
                  ),
                   FittedBox(
                  fit:BoxFit.contain,
                  child: Container( 
                    margin:EdgeInsets.all(1),
                   // color:Colors.grey,
                    width: 5.0,
                    height:2.0,
                    child:Center(
                      child:Text("boggjhghjgjhgjb",
                      textAlign: TextAlign.center,
                        style: TextStyle(
                        color: Colors.black, fontSize: 1.0,)
                      ),
                    ),
                    )
                  ),
              ]
            ),
          ]
        )
        ]
      ),
        
    );
  }
}


             /*mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      new Text('Store'),
                      new Text('Accept Coupons'),
                      new Text('Double'),
                      new Text('Digital Coupons'),
                      new Text('Link'),
                    ],
                  )
                )
              ]),
            //Walgreens
            TableRow(
              children:[
                TableCell(
                  child: Row( 
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      new Text('Walgreens'),
                      new Text('Yes'),
                      new Text('No'),
                      new Text('Yes'),
                      new Text('____'),
                    ],
                  )*/