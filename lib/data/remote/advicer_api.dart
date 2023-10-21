import 'dart:convert';
import 'package:advicer/data/exceptions/exceptions.dart';
import 'package:advicer/data/models/advice_model.dart';
import 'package:http/http.dart' as http;

abstract class AdvicerAPIProtocol {
  Future<AdviceModel> getRandomAdvice();
}

class AdvicerAPI extends AdvicerAPIProtocol {
  final http.Client client;

  AdvicerAPI({ required this.client });

  @override
  Future<AdviceModel> getRandomAdvice() async {
    final response = await client.get(
      Uri.parse('https://api.flutter-community.com/api/v1/advice'),
      headers: {'content-type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return AdviceModel.fromJson(responseBody);
    } else {
      throw ServerException();
    }
  }
}
