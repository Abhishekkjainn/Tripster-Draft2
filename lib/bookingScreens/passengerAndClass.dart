import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PassengerAndClass extends StatelessWidget {
  const PassengerAndClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SelectFromAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  'Traveller\'s',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar SelectFromAppbar() {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Color.fromARGB(255, 255, 214, 0),
      // centerTitle: true,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.white,
          )),
      title: Text(
        'Who\'s Flying',
        style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800),
      ),
    );
  }
}
