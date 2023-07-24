import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QrScreen extends StatelessWidget {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  QrScreen({super.key});


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    final urlRegExp = RegExp(r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?");

    void onQRViewCreated(QRViewController controller) async {
      this.controller = controller;
      controller.scannedDataStream.listen((scanData) async {
        if (urlRegExp.hasMatch(scanData.code!)){
          controller.pauseCamera();
          await launchUrl(Uri.parse(scanData.code!));
          controller.resumeCamera();
        }
      });
    }

    return Stack(
      children: [
        SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: QRView(
            key: qrKey,
            onQRViewCreated: onQRViewCreated,
            formatsAllowed: const [BarcodeFormat.qrcode],
            overlay: QrScannerOverlayShape(
              borderColor: const Color(0xFF02A1FB),
              borderLength: 30,
              borderWidth: 10,
              borderRadius: 20,
              cutOutSize: 230,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
          height: 100,
          color: Colors.transparent,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  SystemChrome.setSystemUIOverlayStyle(
                    const SystemUiOverlayStyle(
                      statusBarIconBrightness: Brightness.light,
                      statusBarBrightness: Brightness.dark,
                      statusBarColor: Color(0xFF02A1FB),
                    ),
                  );
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.white,
                ),
              ),
              const Expanded(
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  child: Text('QR Оплата',),
                ),
              ),
              IconButton(
                onPressed: () async {
                  await controller?.toggleFlash();
                },
                icon: const Icon(Icons.flash_on, size: 24, color: Colors.white,),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
