import 'package:flutter/material.dart';
import 'Components/Deal.dart';

class ShopList extends StatefulWidget {
  ShopList({Key key}) : super(key: key);

  @override
  _ShopListState createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  final _formKey = new GlobalKey<FormState>();

  TextEditingController storeController = TextEditingController();
  TextEditingController itemController1 = TextEditingController();
  TextEditingController itemController2 = TextEditingController();
  TextEditingController itemController3 = TextEditingController();
  TextEditingController dealController1 = TextEditingController();
  TextEditingController dealController2 = TextEditingController();
  TextEditingController dealController3 = TextEditingController();

  List<Deal> deals = [
    Deal("CVS", false, [
      Item("Shampoo", false,
          [Coupon("BOGO", false), Coupon("Use \$3 Deals", false)]),
      Item("Shampoo", false, [Coupon("Spend \$20, Get \$4", false)]),
    ]),
    Deal("CVS", false, [
      Item("Shampoo", false,
          [Coupon("BOGO", false), Coupon("Use \$3 Deals", false)]),
      Item("Shampoo", false, [Coupon("Spend \$20, Get \$4", false)]),
      Item("Shampoo", false,
          [Coupon("BOGO", false), Coupon("Use \$3 Deals", false)]),
      Item("Shampoo", false, [Coupon("Spend \$20, Get \$4", false)]),
      Item("Shampoo", false,
          [Coupon("BOGO", false), Coupon("Use \$3 Deals", false)]),
      Item("Shampoo", false, [Coupon("Spend \$20, Get \$4", false)]),
    ]),
  ];

  Widget build(BuildContext context) {
    ListView body = ListView.builder(
      itemCount: deals.length,
      itemBuilder: (context, int index) => buildStore(deals[index]),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping List"),
      ),
      body: body.build(context),
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
    for (Item item in deal.items) {
      items.add(buildItem(item));
    }
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Center(
        heightFactor: 10,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  deal.store,
                  style: TextStyle(fontSize: 36),
                )
              ],
            ),
            Column(
              children: items,
            )
          ],
        ),
      ),
    );
  }

  Card buildItem(Item item) {
    List<Card> coupons = [];
    for (Coupon coupon in item.coupons) {
      coupons.add(buildCoupon(coupon));
    }

    return Card(
      elevation: 0,
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  item.title,
                  style: TextStyle(fontSize: 24),
                )
              ],
            ),
            Column(
              children: coupons,
            )
          ],
        ),
      ),
    );
  }

  Card buildCoupon(Coupon coupon) {
    return Card(
      borderOnForeground: false,
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Checkbox(
                  value: coupon.have,
                  onChanged: (have) => setState(() => coupon.have = have),
                ),
                Text(coupon.title)
              ],
            )
          ],
        ),
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
            children: <Widget>[
              Text(
                "Store",
                style: TextStyle(
                    fontSize: 28, decoration: TextDecoration.underline),
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
          Column(
            children: <Widget>[
              TextFormField(
                controller: itemController1,
              ),
              TextFormField(
                controller: itemController2,
              ),
              TextFormField(
                controller: itemController3,
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
                        deals.add(Deal(storeController.text, false, [
                          Item(
                              itemController1.text.isNotEmpty
                                  ? itemController1.text
                                  : "",
                              false,
                              [
                                Coupon(
                                    (dealController1.text.isNotEmpty
                                        ? dealController1.text
                                        : ""),
                                    false)
                              ]),
                          Item(
                              itemController2.text.isNotEmpty
                                  ? itemController2.text
                                  : "",
                              false,
                              [
                                Coupon(
                                    dealController2.text.isNotEmpty
                                        ? dealController2.text
                                        : "",
                                    false)
                              ]),
                          Item(
                              itemController3.text.isNotEmpty
                                  ? itemController3.text
                                  : "",
                              false,
                              [
                                Coupon(
                                    dealController3.text.isNotEmpty
                                        ? dealController3.text
                                        : "",
                                    false)
                              ]),
                        ]));
                        storeController.clear();
                        itemController1.clear();
                        itemController2.clear();
                        itemController3.clear();
                        dealController1.clear();
                        dealController2.clear();
                        dealController3.clear();
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
