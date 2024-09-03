import 'package:flutter/material.dart';
import 'package:thewms/common/constants/text_style.dart';
import 'package:thewms/common/widgets/button.dart';
import 'package:thewms/home_page_controller.dart';
import 'package:thewms/services/http/model/barcode_model.dart';
import 'package:thewms/services/http/repository/barcode_http_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BarcodeModel? _barcodeModel;
  final BarcodeHttpRepository _barcodeHttpRepository = BarcodeHttpRepository();
  @override
  void initState() {
    super.initState();
    _fetchBarcodeData();
  }
  
  Future<void> _fetchBarcodeData() async {
    final barcodeData = await _barcodeHttpRepository.findAllBarcode();
    setState(() {
      _barcodeModel = barcodeData;
    });
  }

  @override
  Widget build(BuildContext context) {
    var controller = HomePageController();
    return Scaffold(
        body: ListenableBuilder(
          listenable: controller,
          builder: (context, child) {
          return ListView(
            children: [
            const SizedBox(height: 10),
            Text('TheWMS',
              textAlign: TextAlign.center,
              style: AppTextStyle.bigText.copyWith(
                color: Colors.black,
              )),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 10, bottom: 20),
              child: Button(
                text: 'Adicionar com a Câmera',
                onPressed: () => controller.scanBarcode()
              )
            ),
            const Text('Valor do codigo de barras:'),
            Text(controller.object.barcodeValue),
            _barcodeModel != null
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nome: ${_barcodeModel!.name}'),
                  Text('NCM: ${_barcodeModel!.ncm}'),
                ],
              )
            : const Text('Loading...'),
          ]
        );
        },
      ),
    );
  }
}