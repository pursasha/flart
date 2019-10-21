//Alexandra Gostev
import 'package:flutter/material.dart';
import 'package:flart/ShopList.dart';
import 'package:flart/Policy.dart';
import 'package:flart/Database.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      title: 'Flart App',
      theme: ThemeData(primarySwatch: Colors.indigo,),
      home: MyHomePage(title: 'Coupon Management App'),
    );
  }
}

class MyHomePage extends StatefulWidget 
{
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
  final ShopList shop= ShopList();
  final Policy pol= Policy();
  final Database data= Database();
 /* int _counter = 0;
  void _incrementCounter() 
  {
    setState((){ _counter++;});
  }*/

  @override
  Widget build(BuildContext context) 
  {
    // This method is rerun every time setState is called,
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text(widget.title),
      ),
      body: Center
      (
        //return TabBarView(children:<widget>[Text('FirstTab'),Text('secondTab')],)
        child: 
        Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>
          [
            Text('Insert inspirational quotes & cute images here', style:TextStyle(fontSize:18)),
            Image.asset('image/test.JPG')
            //Text('$_counter', style: Theme.of(context).textTheme.display1,),
          ],
        ),
      ),
      
      endDrawer: Drawer
      (
        child: ListView
        (
          children: <Widget>
          [
            //first tab button option
            FlatButton
            (
              onPressed:()
              {
                Navigator.push(context,MaterialPageRoute(builder: (context) => shop.build(context)));
              },
              child:Text('Shopping List', style:TextStyle(fontSize:28)),
              textTheme: ButtonTextTheme.primary,
              color: Colors.grey[300],
            ),
          
            //second tab option
            FlatButton
            (
              onPressed:()
              {
                 Navigator.push(context,MaterialPageRoute(builder: (context) => pol.build(context)));
              },
              child:Text('Policies', style:TextStyle(fontSize:28)),
              textTheme: ButtonTextTheme.primary,
              color: Colors.grey[300],
            ),
            
            //third tab option
            FlatButton
            (
              onPressed:()
              {
                 Navigator.push(context,MaterialPageRoute(builder: (context) => data.build(context)));
              },
              child:Text('Stock Up Database', style:TextStyle(fontSize:28)),
              textTheme: ButtonTextTheme.primary,
              color: Colors.grey[300],
            ),
            //4th tab option
            FlatButton
            (
              onPressed:()
              {
              //add route later
              },
              child:Text('etc..', style:TextStyle(fontSize:28)),
              textTheme: ButtonTextTheme.primary,
              color: Colors.grey[300],
            ),
          ],
        ),
      ),

      /*floatingActionButton: FloatingActionButton
      (
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/
    );
  }
}
