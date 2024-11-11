// ignore_for_file: file_names

import 'package:app_mercado/models/Produto.dart';
import 'package:flutter/material.dart';


class CardHome extends StatelessWidget {
  Product product;
  // ignore: non_constant_identifier_names
  VoidCallback func_delete;

  CardHome(this.product, this.func_delete, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
              child: ListTile(
                title: Text(product.name),
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle
                ),
                child: 
                Center(child: Column(children: [Text(product.amount.toString(), style: const TextStyle(color: Colors.white, )),
                const Text("un", style: TextStyle(color: Colors.white, fontSize: 8))])) 
                
                ),
                subtitle: Text("Total - R\$ ${product.amountPrice().toStringAsFixed(2)}"), 
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () => {}, icon: Icon(Icons.edit)),
                    IconButton(onPressed: func_delete, icon: Icon(Icons.delete))
                  ],
                ), 
                
              ),
            );
  }
}