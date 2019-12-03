import 'package:flutter/material.dart';
import 'Components/Deal.dart';
import 'Components/shoppingDatabase.dart';

class ShopList extends StatefulWidget {
  ShopList({Key key}) : super(key: key);

  @override
  _ShopListState createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  final _formKey = new GlobalKey<FormState>();

  TextEditingController storeController = TextEditingController();
  TextEditingController itemController = TextEditingController();
  TextEditingController couponController1 = TextEditingController();
  TextEditingController couponController2 = TextEditingController();
  TextEditingController couponController3 = TextEditingController();
  TextEditingController couponController4 = TextEditingController();

  @override
  void initState() {
    super.initState();
    build(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.restore_from_trash),
            onPressed: () => DealDB.db.removeAllDeals(),
          )
        ],
        title: Text("Shopping List"),
      ),
      body: FutureBuilder<List<Deal>>(
          future: DealDB.db.deals(),
          builder: (BuildContext context, AsyncSnapshot<List<Deal>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                List<Deal> deals = snapshot.data;
                if (deals.length > 0) {
                  return ListView.builder(
                    itemCount: deals.length,
                    itemBuilder: (context, int index) =>
                        buildStore(deals[index]),
                  );
                } else {
                  return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, int index) => Center(
                      child: Text(
                        "Add a deal...",
                        style: TextStyle(fontSize: 28),
                      ),
                    ),
                  );
                }
                break;
              case ConnectionState.active:
              case ConnectionState.waiting:
              default:
                return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, int index) => Center(
                    child: CircularProgressIndicator(),
                  ),
                );
                break;
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (context) {
            return Dialog(child: newDealForm());
          },
        ),
      ),
    );
  }

  Card buildStore(Deal deal) {
    List<Card> items = [];
    items.add(buildItem(deal));
    return Card(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                deal.store,
                style: TextStyle(fontSize: 36),
              ),
            ],
          ),
          Column(
            children: items,
          )
        ],
      ),
    );
  }

  Card buildItem(Deal deal) {
    List<Row> coupons = [];
    coupons.add(Row(
      children: <Widget>[
        Text(
          deal.item.title,
          style: TextStyle(fontSize: 24),
        )
      ],
    ));
    for (Coupon coupon in deal.item.coupon) {
      print(coupon.title);

      coupons.add(
        Row(
          children: <Widget>[
            Text(coupon.title),
          ],
        ),
      );
    }

    return Card(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      elevation: 0,
      child: Column(
        children: <Widget>[
          CheckboxListTile(
            value: deal.have,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (changer) {
              setState(() {
                deal.have = changer;
              });
            },
            title: Column(children: coupons),
          ),
        ],
      ),
    );
  }

  Form newDealForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            // STORE
            children: <Widget>[
              Text(
                "Store",
                style: TextStyle(
                    fontSize: 36, decoration: TextDecoration.underline),
              ),
              TextFormField(
                controller: storeController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
          ),
          Column(children: <Widget>[
            // ITEM
            Center(
              child: Text(
                "Item",
                style: TextStyle(fontSize: 30),
              ),
            ),
            TextFormField(
              controller: itemController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ]),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
          ),
          Column(
            // COUPONS
            children: <Widget>[
              Center(
                child: Text("Coupons"),
              ),
              TextFormField(
                controller: couponController1,
              ),
              TextFormField(
                controller: couponController2,
              ),
              TextFormField(
                controller: couponController3,
              ),
              TextFormField(
                controller: couponController4,
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    setState(
                      () {
                        DealDB.db.insertDeal(
                          Deal(
                            storeController.text,
                            false,
                            Item(
                              itemController.text,
                              [
                                Coupon(
                                  (couponController1.text.isNotEmpty
                                      ? couponController1.text
                                      : ""),
                                ),
                                Coupon(
                                  (couponController2.text.isNotEmpty
                                      ? couponController2.text
                                      : ""),
                                ),
                                Coupon(
                                  (couponController3.text.isNotEmpty
                                      ? couponController3.text
                                      : ""),
                                ),
                                Coupon(
                                  (couponController4.text.isNotEmpty
                                      ? couponController4.text
                                      : ""),
                                ),
                              ],
                            ),
                          ),
                        );
                        storeController.clear();
                        itemController.clear();
                        couponController1.clear();
                        couponController2.clear();
                        couponController3.clear();
                        couponController4.clear();
                      },
                    );
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
