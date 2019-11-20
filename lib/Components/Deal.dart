class Deal {
  String store;
  bool have;
  List<Item> items;

  Deal(String store, bool have, List<Item> items) {
    this.store = store;
    this.have = have;
    this.items = items;
  }
}

class Item {
  String title;
  bool have;
  List<Coupon> coupons;

  Item(String title, bool have, List<Coupon> coupons) {
    this.title = title;
    this.have = have;
    this.coupons = coupons;
  }
}

class Coupon {
  String title;
  bool have;

  Coupon(String title, bool have) {
    this.title = title;
    this.have = have;
  }
}
