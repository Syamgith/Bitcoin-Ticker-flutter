import 'dart:convert';

import 'package:http/http.dart' as http;

const apikey = '8665C240-55BE-41F1-A975-061E1F398E63';

class NetworkHelper {
  Future<dynamic> getExchangeRate(String currency) async {
    http.Response response = await http.get(
        'https://rest.coinapi.io/v1/exchangerate/BTC/$currency?apikey=$apikey');
    if (response.statusCode == 200) {
      var decodedBody = jsonDecode(response.body);
      print(decodedBody['asset_id_quote']);
      print(decodedBody['rate']);
      return decodedBody;
    } else {
      return;
    }
  }
}
