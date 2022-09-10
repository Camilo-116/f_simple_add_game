import 'package:get/get.dart';
import 'package:sum_game/ui/controllers/op_controller.dart';

import '../widgets/widgets.dart';
import 'dart:math';

import 'package:flutter/material.dart';

class SumWidget extends StatelessWidget {
  const SumWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OpController opController = Get.find();
    opController.setValues();
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Spacer(flex: 1),
                    Obx(() => Text(
                          'Score: ' + opController.score.toString(),
                          style: const TextStyle(
                            fontSize: 36,
                          ),
                        )),
                    const Spacer(flex: 1),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          opController.reset();
                        },
                        child: const Icon(Icons.replay),
                      ),
                    )
                  ],
                )),
          ),
          flex: 1,
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.blue,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Obx(() => OpWidget(text: opController.op1.toString())),
                    const OpWidget(text: '+'),
                    Obx(() => OpWidget(text: opController.op2.toString())),
                    const OpWidget(text: '='),
                    const OpWidget(text: '?'),
                  ]),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  resultButton(
                      opController, opController.vRta[0], const Key('0')),
                  resultButton(
                      opController, opController.vRta[1], const Key('1')),
                  resultButton(
                      opController, opController.vRta[2], const Key('2')),
                ],
              )),
        )
      ],
    );
  }

  Widget resultButton(OpController opController, int value, Key k) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          key: k,
          onPressed: () => opController.onResultClick(value),
          child: Text(value.toString(),
              style: const TextStyle(
                fontSize: 40,
              ))),
    ));
  }
}

extension RandomInt on int {
  static int generate({int min = 0, required int max}) {
    final _random = Random();
    return min + _random.nextInt(max - min);
  }
}
