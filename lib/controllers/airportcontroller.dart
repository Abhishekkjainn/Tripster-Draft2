import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AirportController extends GetxController {
  String fromAirportCode = 'FROM';
  String fromAirportName = 'FROMARP';
  String fromCity = 'Source';
  String toAirportCode = 'TO';
  String toAirportName = 'TOARP';
  String toCity = 'Destination';
  String interchangeAirportCode = '';
  String interchangeAirportName = '';
  String interchangeCity = '';

  DateTime OnewayDate = DateTime.now();
  DateTime RoundTripStart = DateTime.now();
  DateTime RoundTripEnds = DateTime.now().add(Duration(days: 7));

  int Adults = 1;
  int Child = 0;

  swapAirports() {
    final tempCode = fromAirportCode;
    final tempCity = fromCity;
    fromAirportCode = toAirportCode;
    fromCity = toCity;
    toAirportCode = tempCode;
    toCity = tempCity;

    update();
  }
}
