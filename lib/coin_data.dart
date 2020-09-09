//TODO: Add your imports here.
import 'package:http/http.dart' as http;
import 'dart:convert';

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

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'D9C23202-2915-4672-8F5F-790A4B186EAC';

//https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=

class CoinData {
  //TODO: Create your getCoinData() method here.

  Future getCoinData() async {
    final String requestURL = '$coinAPIURL/BTC/USD?apikey=$apiKey';

    http.Response response = await http.get(requestURL);

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      var price = decodedData['rate'];

      return price;
    } else {
      print(response.statusCode);
    }
  }
}
