import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class Policy {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Policies"),
      ),
      body: Column(
        children: <Widget>[
          Table(
            border: TableBorder.all(width: 1, color: Colors.black),
            defaultVerticalAlignment: TableCellVerticalAlignment.top,
            children: <TableRow>[
              TableRow(
                children: <Widget>[
                  makeTableRowBox("Store", true),
                  makeTableRowBox("Coupons?", true),
                  makeTableRowBox("Digital?", true),
                  makeTableRowBox("Double?", true),
                  makeTableRowBox("Link", true),
                ],
              ),
              makeRow("Walgreens", "Yes", "Yes", "No",
                  "https://www.walgreens.com/topic/generalhelp/coupon_policy_main.jsp?o=acs"),
              makeRow("CVS", "Yes", "Yes", "No",
                  "https://www.cvs.com/bizcontent/general/help/coupon-policy.pdf"),
              makeRow("Target", "Yes", "Yes", "No",
                  "http://help.target.com/help/TargetGuestHelpArticleDetail?articleId=ka91Y000000PG3uQAG&articleTitle=What%27s+the+Target+coupon+policy%3F"),
              makeRow("Rite Aid", "Yes", "Yes", "No",
                  "https://www.riteaid.com/customer-support/coupon-acceptance-policy"),
              makeRow("Price Chopper", "Yes", "Yes", "Yes",
                  "https://www.pricechopper.com/about-us/customer-service/coupon-policy/"),
              makeRow("Walmart", "Yes", "No", "No",
                  "https://corporate.walmart.com/policies#coupon-policy"),
              makeRow("Aldi", "No", "No", "No", "Nope"),
              makeRow("Dollar General", "Yes", "Yes", "No",
                  "http://www2.dollargeneral.com/Customer-Care-Center/pages/coupon-policy.aspx"),
              makeRow("Dollar Tree", "Yes", "No", "No",
                  "https://www.dollartree.com/home?loggedIn=false&page=terms"),
              makeRow("Poly Bookstore", "No", "No", "No", "Nope"),
              makeRow("Family Dollar", "Yes", "Yes", "No",
                  "https://www.familydollar.com/coupon-policy"),
            ],
          ),
        ],
      ),
    );
  }
}

TableRow makeRow(
    String col0, String col1, String col2, String col3, String col4) {
  return TableRow(
    children: <Widget>[
      makeTableRowBox(col0, true),
      makeTableRowBox(col1),
      makeTableRowBox(col2),
      makeTableRowBox(col3),
      makeTableRowBox(col4, false, true),
    ],
  );
}

FittedBox makeTableRowBox(dynamic info, [bool bold = false, bool url = false]) {
  return FittedBox(
    fit: BoxFit.contain,
    child: Container(
      margin: EdgeInsets.all(1),
      width: 5.0,
      height: 2.0,
      child: url == true
          ? Linkify(
              onOpen: (url) async {
                if (await canLaunch(info)) {
                  await launch(info);
                }
              },
              text: info,
            )
          : Text(
              info,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: bold == true ? 1.1 : 1.0,
                fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
              ),
            ),
    ),
  );
}
