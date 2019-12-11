//Alexandra Gostev
//Fall 2019
//Professor Hudson
//Had some help from the internet and peers :)
import 'package:flutter/material.dart';
import 'package:flart/Policy.dart';
import 'package:flart/Database.dart';
import 'package:flart/ShopList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flart App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(title: 'Coupon Management App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ShopList shop = ShopList();
  final Policy pol = Policy();
  final MyHomePage1 data = MyHomePage1();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called
    List<Image> images = [];
    images.add(Image.asset('image/c1.JPG'));
    images.add(Image.asset('image/c2.JPG'));
    images.add(Image.asset('image/c3.JPG'));
    images.add(Image.asset('image/c4.JPG'));
    images.add(Image.asset('image/c5.JPG'));
    images.add(Image.asset('image/c6.JPG'));
    images.add(Image.asset('image/c7.JPG'));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        //return TabBarView(children:<widget>[Text('FirstTab'),Text('secondTab')],)
        child: GridView.count(
          primary: true,
          padding: const EdgeInsets.all(5.0),
          crossAxisCount: 1,
          childAspectRatio: 2,
          mainAxisSpacing: 3.0,
          crossAxisSpacing: 3.0,
          children: images,
        ),

        /*Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Insert inspirational quotes & cute images here',
                style: TextStyle(fontSize: 18)),
            Image.asset('image/test.JPG')
            //Text('$_counter', style: Theme.of(context).textTheme.display1,),
          ],
        ),*/
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            //1st tab button option
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    maintainState: true,
                    builder: (context) => StatefulBuilder(
                      builder: (context, setState) {
                        return shop;
                      },
                    ),
                  ),
                );
              },
              child: Text('Shopping List', style: TextStyle(fontSize: 28)),
              textTheme: ButtonTextTheme.primary,
              color: Colors.grey[300],
            ),

            //2nd tab option
            FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => pol.build(context)));
              },
              child: Text('Policies', style: TextStyle(fontSize: 28)),
              textTheme: ButtonTextTheme.primary,
              color: Colors.grey[300],
            ),

            //third tab option
            FlatButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => data));
              },
              child: Text('Stock Up Database', style: TextStyle(fontSize: 28)),
              textTheme: ButtonTextTheme.primary,
              color: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }
}
