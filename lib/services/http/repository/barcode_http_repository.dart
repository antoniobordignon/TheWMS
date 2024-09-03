import 'dart:convert';
import 'dart:developer';

import 'package:thewms/home_page_controller.dart';
import 'package:thewms/services/http/model/barcode_model.dart';
import 'package:http/http.dart' as http;

class BarcodeHttpRepository {
  @override
  Future<BarcodeModel?> findAllBarcode() async {
    try {
      final response = await http.get(
      Uri.parse('http://www.eanpictures.com.br:9000/api/desc/7894900051513') 
      );
      var decodedResponse = jsonDecode(response.body);
      return BarcodeModel.fromMap(decodedResponse);
    } on Exception catch (e) {
      log(e.toString(), name: "request error");
      return null;
    }
  }
}