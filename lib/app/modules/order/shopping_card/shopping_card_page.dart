import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/formatter_helper.dart';
import '../../../core/ui/widgets/plus_minus_box.dart';
import '../../../core/ui/widgets/vakinha_button.dart';
import 'shopping_card_controller.dart';

class ShoppingCardPage extends GetView<ShoppingCardController> {
  ShoppingCardPage({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: IntrinsicHeight(
                child: Form(
                  key: formKey,
                  child: Obx(
                    () => Visibility(
                      visible: controller.products.isNotEmpty,
                      replacement: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Carrinho',
                              style: context.textTheme.headline6?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: context.theme.primaryColorDark,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text('Nenhum item adicionado no carrinho'),
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  'Carrinho',
                                  style: context.textTheme.headline6?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: context.theme.primaryColorDark,
                                  ),
                                ),
                                IconButton(
                                  onPressed: controller.clear,
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Obx(() {
                            return Column(
                              children: controller.products
                                  .map(
                                    (p) => Container(
                                      margin: const EdgeInsets.all(10),
                                      child: PlusMinusBox(
                                        label: p.product.name,
                                        calculateTotal: true,
                                        elevated: true,
                                        backgroundColor: Colors.white,
                                        quantity: p.quantity,
                                        price: p.product.price,
                                        minusCalback: () {
                                          controller
                                              .subtractQuantityInProduct(p);
                                        },
                                        plusCalback: () {
                                          controller.addQuantityInProduct(p);
                                        },
                                      ),
                                    ),
                                  )
                                  .toList(),
                            );
                          }),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total do pedido',
                                  style: context.textTheme.bodyText1
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                Obx(() {
                                  return Text(
                                    FormatterHelper.formatCurrency(
                                        controller.totalValue),
                                    style: context.textTheme.bodyText1
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  );
                                }),
                              ],
                            ),
                          ),
                          const Divider(),
                          const _AddressField(),
                          const SizedBox(height: 10),
                          const Divider(),
                          const SizedBox(height: 10),
                          const _CpfField(),
                          const SizedBox(height: 10),
                          const Divider(),
                          const Spacer(),
                          Center(
                            child: SizedBox(
                              width: context.widthTransformer(reducedBy: 10),
                              child: VakinhaButton(
                                label: 'FINALIZAR',
                                onPress: () {
                                  final formvalid =
                                      formKey.currentState?.validate() ?? false;
                                  if (formvalid) {
                                    controller.createOrder();
                                  }
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AddressField extends GetView<ShoppingCardController> {
  const _AddressField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
            child: Text(
              'Endereço de entrega',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              controller.address = value;
            },
            validator: Validatorless.required('Endereço obrigatório'),
            decoration: const InputDecoration(
              hintText: 'Digite o endereço',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CpfField extends GetView<ShoppingCardController> {
  const _CpfField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
            child: Text(
              'CPF',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              controller.cpf = value;
            },
            validator: Validatorless.multiple([
              Validatorless.required('CPF obrigatório'),
              Validatorless.cpf('CPF inválido'),
            ]),
            decoration: const InputDecoration(
              hintText: 'Digite o CPF',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
