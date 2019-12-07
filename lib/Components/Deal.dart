class Deal {
  int id;
  String store;
  bool have;
  Item item;

  Deal(String store, bool have, Item item, [int id]) {
    this.id = id;
    this.store = store;
    this.have = have;
    this.item = item;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'store': store,
      'have': (have == true) ? 1 : 0,
      'item': item.title,
      'coupon': item.coupon.toString()
    };
  }
}

class Item {
  String title;
  List<Coupon> coupon;

  Item(String title, [List<Coupon> coupon]) {
    this.title = title;
    this.coupon = coupon;
  }

  Map<String, dynamic> toMap() {
    return {'title': title, 'coupons': coupon.toString()};
  }

  @override
  String toString() {
    return 'title: $title, coupons:' + coupon.toString();
  }
}

class Coupon {
  String title;

  Coupon(String title) {
    this.title = title;
  }

  @override
  String toString() {
    return 'title: $title';
  }
}
