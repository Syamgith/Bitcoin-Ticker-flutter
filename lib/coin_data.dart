import 'package:flutter/material.dart';

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
  List<DropdownMenuItem<String>> getCurrencyList() {
    List<DropdownMenuItem<String>> items = [];
    for (int i = 0; i < currenciesList.length - 1; i++) {
      items.add(DropdownMenuItem(
          child: Text(currenciesList[i]), value: currenciesList[i]));
    }
    return items;
  }
}
