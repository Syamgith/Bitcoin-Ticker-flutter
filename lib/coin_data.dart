import 'dart:convert';

import 'package:http/http.dart' as http;

const apikey = '8665C240-55BE-41F1-A975-061E1F398E63';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<dynamic> getExchangeRate(String currency1, String currency2) async {
    http.Response response = await http.get(
        'https://rest.coinapi.io/v1/exchangerate/$currency1/$currency2?apikey=$apikey');
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
