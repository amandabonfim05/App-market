import 'dart:convert';

import 'package:app_mercado/models/Produto.dart';
import 'package:http/http.dart' as http;

class ExternalAccess {
  Future<String> enviar_dados(Product produto) async {
    var resp = await http.post(Uri.parse('[url]/compra.json'),
        body: jsonEncode({"nome": produto.name, "value": produto.price, "amount": produto.amount}));

    dynamic json_add_dado = jsonDecode(resp.body);

    return json_add_dado["nome"];
  }

  dynamic obter_dados() async {
  try {
    final response = await http.get(Uri.parse('[url]/compra.json'));

    dynamic jsonProduto = jsonDecode(response.body);

    if (jsonProduto == null) {}
    return jsonProduto;
  } on Exception catch (_) {
    print('Lista vazia');
  }
}
}