import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripster_draft2/bookingScreens/fromScreen.dart';
import 'package:tripster_draft2/bookingScreens/passengerAndClass.dart';
import 'package:tripster_draft2/bookingScreens/toScreen.dart';
import 'package:tripster_draft2/controllers/airportcontroller.dart';
import 'package:tripster_draft2/controllers/radiocontroller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final radioController = Get.put(RadioController());
  final airportController = Get.put(AirportController());

  @override
  void initState() {
    super.initState();
    radioController.selectedRadio = 1;
  }

  String calcDay(int weekday) {
    if (weekday == 1) {
      return 'Mon';
    }
    if (weekday == 2) {
      return 'Tue';
    }
    if (weekday == 3) {
      return 'Wed';
    }
    if (weekday == 4) {
      return 'Thu';
    }
    if (weekday == 5) {
      return 'Fri';
    }
    if (weekday == 6) {
      return 'Sat';
    }
    if (weekday == 8) {
      return 'Sun';
    } else {
      return 'Null';
    }
  }

  String CalcMonth(Monthint) {
    if (Monthint == 1) {
      return 'Jan';
    }
    if (Monthint == 2) {
      return 'Feb';
    }
    if (Monthint == 3) {
      return 'Mar';
    }
    if (Monthint == 4) {
      return 'Apr';
    }
    if (Monthint == 5) {
      return 'May';
    }
    if (Monthint == 6) {
      return 'Jun';
    }
    if (Monthint == 7) {
      return 'Jul';
    }
    if (Monthint == 8) {
      return 'Aug';
    }
    if (Monthint == 9) {
      return 'Sep';
    }
    if (Monthint == 10) {
      return 'Oct';
    }
    if (Monthint == 11) {
      return 'Nov';
    }
    if (Monthint == 12) {
      return 'Dec';
    } else {
      return 'Null';
    }
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
              height: 430,
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 255, 214, 0)),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: GetBuilder<RadioController>(
                  builder: (controller) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22)),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            radioSection(), //One Way , Round Trip Selector
                            GetBuilder<AirportController>(
                              builder: (controller) {
                                return fromToSection(airportController);
                              },
                            ),
                            //From to Selctor Container
                            (radioController.selectedRadio == 1)
                                ? onewayDateSection(airportController)
                                : roundTripDateSection(
                                    airportController), //Date Selector
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

  Padding passengerSelectionSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          Get.to(() => PassengerAndClass(), transition: Transition.downToUp);
        },
        child: Container(
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
        ),
      ),
    );
  }

  Padding roundTripDateSection(AirportController airportController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () async {
          final DateTimeRange? dateTimeRange = await showDateRangePicker(
              barrierColor: Colors.yellow,
              context: context,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 2500)));

          setState(() {
            if (dateTimeRange != null) {
              airportController.RoundTripStart = dateTimeRange.start;
              airportController.RoundTripEnds = dateTimeRange.end;
            }
          });
        },
        child: Container(
          height: 70,
          decoration: const BoxDecoration(
              border: BorderDirectional(
                  bottom: BorderSide(color: Colors.grey, width: 1))),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 20),
                child: Icon(CupertinoIcons.calendar),
              ),
              Text(
                calcDay(airportController.RoundTripStart.weekday) + ', ',
                style: TextStyle(
                    color: Color.fromARGB(255, 53, 53, 53),
                    fontWeight: FontWeight.w900,
                    fontSize: 18),
              ),
              Text(
                airportController.RoundTripStart.day.toString() +
                    ' ' +
                    CalcMonth(airportController.RoundTripStart.month),
                style: TextStyle(
                    color: Color.fromARGB(255, 53, 53, 53),
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              Text(' - '),
              Text(
                calcDay(airportController.RoundTripEnds.weekday) + ', ',
                style: TextStyle(
                    color: Color.fromARGB(255, 53, 53, 53),
                    fontWeight: FontWeight.w900,
                    fontSize: 18),
              ),
              Text(
                airportController.RoundTripEnds.day.toString() +
                    ' ' +
                    CalcMonth(airportController.RoundTripEnds.month),
                style: TextStyle(
                    color: Color.fromARGB(255, 53, 53, 53),
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector onewayDateSection(AirportController airportController) {
    return GestureDetector(
      onTap: () async {
        DateTime? onewayDate = await showDatePicker(
            context: context,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 2500)));

        if (onewayDate != null) {
          setState(() {
            airportController.OnewayDate = onewayDate;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          height: 70,
          decoration: const BoxDecoration(
              border: BorderDirectional(
                  bottom: BorderSide(color: Colors.grey, width: 1))),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 20),
                child: Icon(CupertinoIcons.calendar),
              ),
              Text(
                calcDay(airportController.OnewayDate.weekday) + ', ',
                style: TextStyle(
                    color: Color.fromARGB(255, 53, 53, 53),
                    fontWeight: FontWeight.w900,
                    fontSize: 18),
              ),
              Text(
                airportController.OnewayDate.day.toString() +
                    ' ' +
                    CalcMonth(airportController.OnewayDate.month),
                style: TextStyle(
                    color: Color.fromARGB(255, 53, 53, 53),
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding fromToSection(AirportController airportController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
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
                              Get.to(() => const SelectFrom(),
                                  transition: Transition.downToUp);
                            },
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Icon(Icons.flight_takeoff_rounded),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 60,
                                      decoration: const BoxDecoration(
                                          border: BorderDirectional(
                                              bottom: BorderSide(
                                                  color: Colors.grey,
                                                  width: 1))),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Text(
                                              airportController.fromAirportCode,
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 53, 53, 53),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ),
                                          Text(
                                            airportController.fromCity,
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
                            onTap: () {
                              Get.to(() => SelectTo(),
                                  transition: Transition.upToDown);
                            },
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Icon(Icons.flight_land_rounded),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 60,
                                      decoration: const BoxDecoration(),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Text(
                                              airportController.toAirportCode,
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 53, 53, 53),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ),
                                          Text(
                                            airportController.toCity,
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
                    onPressed: () {
                      airportController.swapAirports();
                    },
                    icon: const Icon(CupertinoIcons.arrow_up_arrow_down)))
          ],
        ),
      ),
    );
  }

  Padding radioSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
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
