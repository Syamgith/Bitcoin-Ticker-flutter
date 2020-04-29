import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'card_new_widget.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinData coinData = CoinData();
  String selectedCurrency = 'INR';
  var bExchangeData;
  var eExchangeData;
  var lExchangeData;
  double bTCRate = 0;
  double eTHRate = 0;
  double lTCRate = 0;

  void UiChange() async {
    bExchangeData = await coinData.getExchangeRate('BTC', selectedCurrency);
    eExchangeData = await coinData.getExchangeRate('ETH', selectedCurrency);
    lExchangeData = await coinData.getExchangeRate('LTC', selectedCurrency);
    setState(() {
      bTCRate = bExchangeData['rate'];
      eTHRate = eExchangeData['rate'];
      lTCRate = lExchangeData['rate'];
    });
  }

  DropdownButton<String> androidDropDown() {
    List<DropdownMenuItem<String>> items = [];
    for (String currency in currenciesList) {
      items.add(DropdownMenuItem(child: Text(currency), value: currency));
    }
    return DropdownButton<String>(
        value: selectedCurrency,
        items: items,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value;
            UiChange();
          });
        });
  }

  CupertinoPicker iOSPicker() {
    List<Text> items = [];
    for (String currency in currenciesList) {
      items.add(Text(currency));
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {},
      children: items,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UiChange();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              children: <Widget>[
                CardNew(
                  currecyRate: bTCRate,
                  selectedCurrency: selectedCurrency,
                  currency1: 'BTC',
                ),
                CardNew(
                  currecyRate: eTHRate,
                  selectedCurrency: selectedCurrency,
                  currency1: 'ETH',
                ),
                CardNew(
                  currecyRate: lTCRate,
                  selectedCurrency: selectedCurrency,
                  currency1: 'LTC',
                )
              ],
            ),
          ),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: Platform.isIOS ? iOSPicker() : androidDropDown()),
        ],
      ),
    );
  }
}
