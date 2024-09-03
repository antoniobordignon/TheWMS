import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class HomePageController extends ChangeNotifier {
  Increment object = Increment();
  
  void getbarcode() async {
    object.barcodeValue = '';
    notifyListeners();
  }

  Future<void> scanBarcode() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666',
      'Cancelar',
      true,
      ScanMode.BARCODE,
    );
    log(barcodeScanRes);

    if(barcodeScanRes == '-1'){
      log('Cancelado');
    }else{
      object.barcodeValue = barcodeScanRes;
      notifyListeners();
    }
  }
}

class Increment { 
  String barcodeValue = '';
}