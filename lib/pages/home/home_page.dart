import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:cronodoro/pages/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.title,
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Container(
        child: Center(
          child: Text(
            "Home Page!!",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
