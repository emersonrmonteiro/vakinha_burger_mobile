import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/ui/widgets/vakinha_button.dart';
import '../../../models/order_pix.dart';

class FinishedPage extends StatelessWidget {
  FinishedPage({Key? key}) : super(key: key);
  final OrderPix _orderPix = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(),
                Image.asset(
                  'assets/images/logo_rounded.png',
                  width: context.widthTransformer(reducedBy: 50),
                  height: context.heightTransformer(reducedBy: 70),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Pedido realizado com sucesso clique no botão abaixo para acesso o QRCode do pix',
                    textAlign: TextAlign.center,
                    style: context.textTheme.headline6?.copyWith(
                      color: context.theme.primaryColorDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: context.widthTransformer(reducedBy: 30),
                  child: VakinhaButton(
                    label: 'PIX',
                    onPress: () {
                      Get.toNamed('/orders/pix', arguments: _orderPix);
                    },
                    color: context.theme.primaryColorDark,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: context.widthTransformer(reducedBy: 10),
                  child: VakinhaButton(
                    label: 'FECHAR',
                    onPress: () {
                      Get.offAllNamed('/home');
                    },
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          )
        ],
      ),
    );
  }
}
