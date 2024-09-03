class BarcodeModel {
  String name;
  String ncm;
  BarcodeModel({
    required this.name,
    required this.ncm,
  });

  factory BarcodeModel.fromMap(Map<String, dynamic> map) {
    return BarcodeModel(name: map['Nome'], ncm: map['Ncm']);
  }
}


// String jsonFake = '{"nome" : Antonio, "ncm": 951294129}';
// var obj = BarcodeModel.fromMap(jsonDecode(jsonFake));