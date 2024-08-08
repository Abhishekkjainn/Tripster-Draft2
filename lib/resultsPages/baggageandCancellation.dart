import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tripster_draft2/controllers/airportcontroller.dart';
import 'package:tripster_draft2/controllers/returnSearch.dart';
import 'package:tripster_draft2/controllers/searchcontroller.dart';

class BaggagePage extends StatefulWidget {
  final int index;
  const BaggagePage({super.key, required this.index});

  @override
  State<BaggagePage> createState() => _BaggagePageState();
}

class _BaggagePageState extends State<BaggagePage> {
  OnewayController onewayController = Get.find();
  AirportController airportController = Get.find();
  ReturnController returnController = Get.find();
  String formatDate(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat('d MMM').format(dateTime);
  }

  String formatDuration(int minutes) {
    final int hours = minutes ~/ 60;
    final int remainingMinutes = minutes % 60;
    return '${hours}h ${remainingMinutes}min';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(onewayController.Id[widget.index].toString());
    airportController
        .callonewayCancellation(onewayController.Id[widget.index].toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baggagepageappbar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TopInfoBanner(),
            BaggagePolicyCard(),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: IntrinsicHeight(
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Cancellation Policies",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  CupertinoIcons.forward,
                                  color: Colors.blue,
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              onewayController.Mealname[widget.index],
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding BaggagePolicyCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: IntrinsicHeight(
        child: Container(
          // height: 300,
          width: double.maxFinite,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Baggage Policy',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.forward,
                          color: Colors.blue,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.bag_fill,
                          color: Colors.grey,
                          size: 16,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Cabin Bag',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Text(
                      onewayController.Cabinbag[widget.index],
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.bag_fill,
                          color: Colors.grey,
                          size: 16,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Check-In',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Text(
                      onewayController.Baggage[widget.index],
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: double.maxFinite,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 221, 221, 221),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Image(
                            image: AssetImage('assets/images/travel.png'),
                            width: 25,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Want Extra Luggage? You can buy the Extra Luggage after Seat Selection at Cheaper Rates.',
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding TopInfoBanner() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        width: double.maxFinite,
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image(
                  image: (onewayController.AirlineCode[widget.index]
                              .toString()
                              .toLowerCase() ==
                          '6e')
                      ? const AssetImage('assets/images/indigo.png')
                      : (onewayController.AirlineCode[widget.index]
                                  .toString()
                                  .toLowerCase() ==
                              'uk')
                          ? const AssetImage('assets/images/vistaralogo.png')
                          : (onewayController.AirlineCode[widget.index]
                                      .toString()
                                      .toLowerCase() ==
                                  'sg')
                              ? const AssetImage('assets/images/spicejet.jpg')
                              : const AssetImage(
                                  'assets/images/airindialogo.jpg'),
                  width: 50,
                  height: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      airportController.fromAirportCode +
                          " - " +
                          airportController.toAirportCode,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      formatDate(airportController.OnewayDate.toString()
                              .split('T')[0]) +
                          " | " +
                          onewayController.DepTime[widget.index]
                              .toString()
                              .split('T')[1] +
                          " - " +
                          onewayController.ArrTime[widget.index]
                              .toString()
                              .split('T')[1] +
                          " | " +
                          formatDuration(
                              onewayController.Duration[widget.index]) +
                          " | " +
                          onewayController.Stops[widget.index].toString() +
                          " Stops",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar baggagepageappbar() {
    return AppBar(
      toolbarHeight: 50,
      backgroundColor: const Color.fromARGB(255, 255, 214, 1),
      centerTitle: true,
      title: const Text(
        'Flight Details',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
      ),
    );
  }
}
