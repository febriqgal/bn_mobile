import '../../../../common/widgets/icon_back_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qrscan/qrscan.dart' as scanner;

import '../../../../common/themes/icons.dart';
import '../../../../common/themes/images.dart';
import '../../../../common/widgets/show_toaster.dart';

class QrisPage extends StatelessWidget {
  static const bool isRoot = true;
  static const String name = "qris";
  static String get path => isRoot ? '/$name' : name;
  const QrisPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();
    MobileScannerController cameraController = MobileScannerController(
      facing: CameraFacing.back,
      detectionSpeed: DetectionSpeed.noDuplicates,
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('QRIS'),
        leading: const AppIconBackButton(),
        actions: [
          IconButton(
            icon: ValueListenableBuilder(
              valueListenable: cameraController.torchState,
              builder: (context, state, child) {
                switch (state) {
                  case TorchState.off:
                    return const AppIcon(
                      path: AppIconPath.flashOff,
                      color: Colors.black,
                    );
                  case TorchState.on:
                    return const AppIcon(
                      path: AppIconPath.flashOn,
                      color: Colors.black,
                    );
                }
              },
            ),
            onPressed: () => cameraController.toggleTorch(),
          ),
          IconButton(
            onPressed: () => picker.pickMedia().then(
                  (value) => value!
                      .readAsBytes()
                      .then(
                        (value) => scanner.scanBytes(value),
                      )
                      .then(
                        (value) => showToastSuccess(context, value),
                      ),
                ),
            icon: const AppIcon(
              path: AppIconPath.image,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                textAlign: TextAlign.center,
                'Arahkan kamera ke kode QRIS untuk melakukan Pembayaran',
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                width: 300,
                height: 300,
                child: MobileScanner(
                  scanWindow: const Rect.fromLTWH(0, 0, 300, 300),
                  fit: BoxFit.cover,
                  controller: cameraController,
                  onDetect: (capture) => capture.barcodes
                      .map(
                        (e) => showToastSuccess(
                          context,
                          e.rawValue.toString(),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            Image.asset(
              AppImagePath.qris,
              height: 60,
              width: 60,
              filterQuality: FilterQuality.high,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
