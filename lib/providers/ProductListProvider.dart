import 'package:app_mercado/config/db/db_config.dart';
import 'package:app_mercado/config/db/db_operantions/sqlite_db_action.dart';
import 'package:app_mercado/config/external_access.dart';
import 'package:app_mercado/models/Produto.dart';
import 'package:flutter/material.dart';

class ProductListProvider with ChangeNotifier {
  List<Product> _products = [];

  void initDB(){
    SqliteDbAction.init_state();
  }

  void add(Product p){
    _products.add(p);
    notifyListeners();
  }

  void add_params(int id, String name, double price, int amount){
    Product p = Product(id, name, price, amount);
  
    ExternalAccess().enviar_dados(p);
    
    _products.add(p);
    notifyListeners();

    SqliteDbAction.adicionar_registro(DbConfig.TABLE_NAME_PRODUCT, {p.id.toString(): p});
  }

  int returnLast(){
    if(_products.length == 0)
      return 0;
      
    return _products.last.id;
  }

  int returnLen(){
    return _products.length;
  }

  Product returnProduct(int index){
    return _products[index];
  }

  void removeProduct(int index){
    _products.removeAt(index);

    SqliteDbAction.remover_registro(DbConfig.TABLE_NAME_PRODUCT, index.toString());

    notifyListeners();
  }
  
}