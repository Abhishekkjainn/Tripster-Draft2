import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectFrom extends StatelessWidget {
  const SelectFrom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(CupertinoIcons.back)),
        title: Text(
          'Where To?',
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
