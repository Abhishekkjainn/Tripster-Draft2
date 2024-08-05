import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';
import 'package:tripster_draft2/controllers/airportcontroller.dart';
import 'package:tripster_draft2/controllers/searchcontroller.dart';

class SelectedFlight extends StatefulWidget {
  final int index;
  const SelectedFlight({super.key, required this.index});

  @override
  State<SelectedFlight> createState() => _SelectedFlightState();
}

class _SelectedFlightState extends State<SelectedFlight> {
  OnewayController onewayController = Get.find();
  AirportController airportController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(CupertinoIcons.back)),
        backgroundColor: Color.fromARGB(255, 255, 214, 0),
        title: Text(
          'Flight Type',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AllTravelDetailsCard(widget.index),
          ],
        ),
      ),
    );
  }

  String formatDate(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat('d MMM').format(dateTime);
  }

  String formatDuration(int minutes) {
    final int hours = minutes ~/ 60;
    final int remainingMinutes = minutes % 60;
    return '${hours}h ${remainingMinutes}min';
  }

  Padding AllTravelDetailsCard(index) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10)),
        width: double.maxFinite,
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 70,
              decoration: BoxDecoration(
                  border: BorderDirectional(
                      bottom: BorderSide(color: Colors.grey, width: 1))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        onewayController.DepAirportCode[index].toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Icon(
                          CupertinoIcons.arrow_right,
                          size: 20,
                        ),
                      ),
                      Text(
                        onewayController.ArrAirportCode[index].toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0, right: 2),
                        child: Text(
                          formatDate(airportController.OnewayDate.toString()) +
                              ' ~',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2, right: 3),
                        child: Text(
                          '${airportController.Adults} Adult ~',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      (airportController.Child == 0)
                          ? Text('')
                          : Padding(
                              padding: const EdgeInsets.only(left: 2, right: 3),
                              child: Text(
                                '${airportController.Child} Child ~',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2, right: 2),
                        child: Text(
                          airportController.SelectedCabin,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            image: (onewayController.AirlineCode[index]
                                        .toString()
                                        .toLowerCase() ==
                                    '6e')
                                ? AssetImage('assets/images/indigo.png')
                                : (onewayController.AirlineCode[index]
                                            .toString()
                                            .toLowerCase() ==
                                        'uk')
                                    ? AssetImage(
                                        'assets/images/vistaralogo.png')
                                    : (onewayController.AirlineCode[index]
                                                .toString()
                                                .toLowerCase() ==
                                            'sg')
                                        ? AssetImage(
                                            'assets/images/spicejet.jpg')
                                        : AssetImage(
                                            'assets/images/airindialogo.jpg'),
                            width: 25,
                          ),
                        ),
                      ),
                      Text(
                        // 'Indigo | 6E 6114',
                        onewayController.AirlineList[index] +
                            ' | ' +
                            onewayController.AirlineCode[index] +
                            ' ' +
                            onewayController.Flightname[index],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                onewayController.DepTime[index].split('T')[1],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16),
                              ),
                              Text(
                                onewayController.DepAirportCode[index] +
                                    ' . ' +
                                    formatDate(onewayController.DepDate[index]
                                        .split('T')[0]),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                ),
                              )
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              (onewayController.Stops[index] == 0)
                                  ? 'Non-Stop'
                                  : (onewayController.Stops[index].toString() +
                                      ' Stops'),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            Image(
                              image: AssetImage('assets/images/divider.png'),
                              width: 100,
                            ),
                            Text(
                              formatDuration(onewayController.Duration[index]),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                onewayController.ArrTime[index].split('T')[1],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16),
                              ),
                              Text(
                                onewayController.ArrAirportCode[index] +
                                    ' . ' +
                                    formatDate(onewayController.ArrDate[index]
                                        .split('T')[0]),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                onewayController.DepCityName[index],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16),
                              ),
                              Container(
                                width: 120,
                                child: Text(
                                  onewayController.DepAirportName[index],
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  (onewayController.DepTerminal[index]
                                              .toString() ==
                                          'null')
                                      ? 'No Data'
                                      : onewayController.DepTerminal[index]
                                          .toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                onewayController.ArrCityName[index],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                width: 120,
                                child: Text(
                                  onewayController.ArrAirportName[index],
                                  textAlign: TextAlign.end,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  onewayController.ArrTerminal[index]
                                      .toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
