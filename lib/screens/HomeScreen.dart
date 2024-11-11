// ignore_for_file: file_names

import 'dart:async';
import 'package:app_mercado/providers/ProductListProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/routes.dart';
import '../widgets/CardHome.dart';
import '../widgets/appBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var p = Provider.of<ProductListProvider>(context, listen: false);

    Future<void> atualizaCompra(BuildContext context) async {
      setState(() {});
    }

    initState() {
      p = Provider.of<ProductListProvider>(context, listen: false);
    }

    return RefreshIndicator(
        onRefresh: () => atualizaCompra(context),
        child: Scaffold(
          appBar: myAppBar(context, "Bem vindo!"),
          body: ListView.builder(
              itemCount: p.returnLen(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return CardHome(
                    p.returnProduct(index),
                    () {
                          setState(() {
                            p.removeProduct(index);
                          });
                        });
              }),
          floatingActionButton: FloatingActionButton(
            onPressed: () => {
              Navigator.of(context).pushNamed(Routes.ADD_PRODUCT)

              /* .then((value) => setState(() {
                                    p = Provider.of<ProductListProvider>(context, listen: false);
                                        
                                  }))*/
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.red,
          ),
        ));
  }
}
