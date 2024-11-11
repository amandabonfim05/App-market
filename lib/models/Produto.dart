class Product {
   int id;
   String name;
   double price;
   int amount;

  Product(this.id, this.name, this.price, this.amount);

  double amountPrice() {
    return price * amount;
  }
}