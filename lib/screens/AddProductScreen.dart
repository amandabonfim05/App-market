import 'package:app_mercado/providers/ProductListProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../widgets/appBar.dart';
import '../widgets/primaryButton.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final amountController = TextEditingController();
    final priceController = TextEditingController();

    return Scaffold(
      appBar: myAppBar(context,"Cadastre um produto"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
                padding: const EdgeInsets.only(left:50.0, right: 50.0, top:30.0),
                child:  TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: "Entre com nome do produto",
                          ),
                        )
          ),

          Container(
                padding: const EdgeInsets.only(left:50.0, right: 50.0, top:30.0),
                child:  TextField(
                          controller: priceController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          decoration: const InputDecoration(
                            labelText: "Entre com o valor",
                          ),
                        )
          ),

          Container(
                padding: const EdgeInsets.only(left:50.0, right: 50.0, top:30.0, bottom: 50.0),
                child:  TextField(
                        
                        controller: amountController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          decoration: const InputDecoration(
                            labelText: "Entre com a quantidade",
                          ),
                        )
          ),

          primaryButton("Salvar", () => {
                                             
                                            
                                            Provider.of<ProductListProvider>(context, listen: false).add_params(Provider.of<ProductListProvider>(context, listen: false).returnLast() + 1, 
                                                                                                 nameController.text,
                                                                                                 double.parse( priceController.text),
                                                                                                 int.parse(amountController.text)),
                                            
                                            Navigator.of(context).pop()
                                            })
         
        
        ],
      ),
    );
  }
}