import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/ui/formatter_helper.dart';
import '../../../core/ui/widgets/vakinha_appbar.dart';

class PixPage extends StatelessWidget {
  PixPage({Key? key}) : super(key: key);

  final _orderPix = Get.arguments;

  @override
  Widget build(BuildContext context) {
    var qrCode = Uri.parse(_orderPix.image).data;
    return Scaffold(
      appBar: VakinhaAppbar(),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Valor a Pagar',
                  style: context.textTheme.headline4,
                ),
                Text(
                  FormatterHelper.formatCurrency(_orderPix.totalValue),
                  style: context.textTheme.headline4?.copyWith(
                    color: context.theme.primaryColorDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.memory(
                  qrCode!.contentAsBytes(),
                  width: context.widthTransformer(reducedBy: 50),
                  height: context.heightTransformer(reducedBy: 50),
                ),
                TextButton(
                    style: TextButton.styleFrom(primary: Colors.grey),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: _orderPix.code));
                      Get.rawSnackbar(
                        message: 'Código PIX copiado',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                    child: Text(
                      'PIX copia e cola',
                      style: context.textTheme.headline4?.copyWith(
                        fontSize: 30,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.dashed,
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
