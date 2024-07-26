import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripster_draft2/bookingScreens/fromScreen.dart';
import 'package:tripster_draft2/controllers/radiocontroller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final radioController = Get.put(RadioController());

  @override
  void initState() {
    super.initState();
    radioController.selectedRadio = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              height: 440,
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 255, 214, 0)),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: GetBuilder<RadioController>(
                  builder: (controller) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            radioSection(), //One Way , Round Trip Selector
                            fromToSection(), //From to Selctor Container
                            (radioController.selectedRadio == 1)
                                ? onewayDateSection()
                                : roundTripDateSection(), //Date Selector
                            passengerSelectionSection(), //Passenger and Cabin class Selection
                            searchButtonSection() //Search Button
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ), //Container for the Body of the Booking Form
            signinBanner(),
            travelblogsheading(),
            travelblogssubheading(),
          ],
        ),
      ),
    );
  }

  Container searchButtonSection() {
    return Container(
      width: double.maxFinite,
      alignment: Alignment.center,
      height: 60,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 214, 0),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(18))),
      child: const Text(
        'Search',
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  Container passengerSelectionSection() {
    return Container(
      height: 70,
      decoration: const BoxDecoration(),
      child: const Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 20),
            child: Icon(CupertinoIcons.person),
          ),
          Text(
            'Adult 1, ',
            style: TextStyle(
                color: Color.fromARGB(255, 53, 53, 53),
                fontWeight: FontWeight.w900,
                fontSize: 18),
          ),
          Text(
            'Economy,',
            style: TextStyle(
                color: Color.fromARGB(255, 53, 53, 53),
                fontWeight: FontWeight.w600,
                fontSize: 14),
          ),
          Text(
            ' Student',
            style: TextStyle(
                color: Color.fromARGB(255, 53, 53, 53),
                fontWeight: FontWeight.w600,
                fontSize: 14),
          )
        ],
      ),
    );
  }

  Container roundTripDateSection() {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
          border: BorderDirectional(
              bottom: BorderSide(color: Colors.grey, width: 1))),
      child: const Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 20),
            child: Icon(CupertinoIcons.calendar),
          ),
          Text(
            'Sat ,',
            style: TextStyle(
                color: Color.fromARGB(255, 53, 53, 53),
                fontWeight: FontWeight.w900,
                fontSize: 18),
          ),
          Text(
            '15 July',
            style: TextStyle(
                color: Color.fromARGB(255, 53, 53, 53),
                fontWeight: FontWeight.w600,
                fontSize: 16),
          ),
          Text(' - '),
          Text(
            'Mon ,',
            style: TextStyle(
                color: Color.fromARGB(255, 53, 53, 53),
                fontWeight: FontWeight.w900,
                fontSize: 18),
          ),
          Text(
            '17 July',
            style: TextStyle(
                color: Color.fromARGB(255, 53, 53, 53),
                fontWeight: FontWeight.w600,
                fontSize: 16),
          )
        ],
      ),
    );
  }

  Container onewayDateSection() {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
          border: BorderDirectional(
              bottom: BorderSide(color: Colors.grey, width: 1))),
      child: const Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 20),
            child: Icon(CupertinoIcons.calendar),
          ),
          Text(
            'Sat ,',
            style: TextStyle(
                color: Color.fromARGB(255, 53, 53, 53),
                fontWeight: FontWeight.w900,
                fontSize: 18),
          ),
          Text(
            '15 July',
            style: TextStyle(
                color: Color.fromARGB(255, 53, 53, 53),
                fontWeight: FontWeight.w600,
                fontSize: 16),
          )
        ],
      ),
    );
  }

  Container fromToSection() {
    return Container(
      height: 120,
      decoration: const BoxDecoration(
          border: BorderDirectional(bottom: BorderSide(color: Colors.grey))),
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                decoration: const BoxDecoration(),
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => SelectFrom(),
                                transition: Transition.downToUp);
                          },
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Icon(Icons.flight_takeoff_rounded),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 60,
                                    decoration: const BoxDecoration(
                                        border: BorderDirectional(
                                            bottom: BorderSide(
                                                color: Colors.grey, width: 1))),
                                    child: const Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Text(
                                            'PQN',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 53, 53, 53),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                        Text(
                                          'Pune',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 53, 53, 53),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Icon(Icons.flight_land_rounded),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 60,
                                    decoration: const BoxDecoration(),
                                    child: const Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Text(
                                            'BOM',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 53, 53, 53),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                        Text(
                                          'Mumbai',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 53, 53, 53),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.arrow_up_arrow_down)))
        ],
      ),
    );
  }

  Container radioSection() {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
          border: BorderDirectional(
              bottom: BorderSide(color: Colors.grey, width: 1))),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                        value: 1,
                        activeColor: Colors.yellow,
                        groupValue: radioController.selectedRadio,
                        autofocus: true,
                        onChanged: radioController.handleRadioValueChange),
                    const Text(
                      'One-Way',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                        value: 2,
                        activeColor: Colors.yellow,
                        groupValue: radioController.selectedRadio,
                        onChanged: radioController.handleRadioValueChange),
                    const Text(
                      'Round-Trip',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Padding signinBanner() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 15),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(20)),
        width: double.maxFinite,
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 20, top: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Cheaper Prices on Flight Bookings',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          'Sign in and get upto 10% cheaper prices on flight bookings',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 35,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 214, 0),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(),
                  child: const Image(
                      image: AssetImage('assets/images/discount.png')),
                ))
          ],
        ),
      ),
    );
  }

  Padding travelblogssubheading() {
    return const Padding(
      padding: EdgeInsets.only(left: 20, right: 10),
      child: Text(
        'Explore the famous tourist attractions you would love to travel',
        style: TextStyle(
            color: Color.fromARGB(255, 137, 137, 137),
            fontSize: 14,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding travelblogsheading() {
    return const Padding(
      padding: EdgeInsets.only(left: 20, top: 10),
      child: Text(
        'Travel Blogs and Attractions',
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),
      ),
    );
  }
}
