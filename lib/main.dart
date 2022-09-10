import 'package:get/get.dart';
import 'package:sum_game/ui/controllers/op_controller.dart';

import 'ui/app.dart';

import 'package:flutter/material.dart';

void main() {
  Get.put(OpController());
  runApp(const MyApp());
}
